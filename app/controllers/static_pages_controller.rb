class StaticPagesController < ApplicationController
  def home
    # @posts = Post.all

    url = URI.parse("http://rails-magic.blogspot.com/feeds/posts/default?alt=json")
    request = Net::HTTP::Get.new(url)

    begin
      response = Net::HTTP.start(url.host, url.port,
        read_timeout: 5) {|http| http.request(request)}
    rescue => e
      Rails.logger.error e.message
    end
    if response.kind_of? Net::HTTPOK
      json_obj = JSON.parse(response.body)
      index = 0
      @posts = json_obj["feed"]["entry"].map do |article|
        index += 1
        {
          id: "post#{index}",
          title: article["title"]["$t"],
          date: article["published"]["$t"],
          image_url:  article["media$thumbnail"]["url"].sub('s72-c', 's350'),
          post_url: article["link"][4]["href"],
          content: ActionView::Base.full_sanitizer.sanitize(article["content"]["$t"])[0,300]+"..."
        }
      end

    per_page = 10
    @total = (@posts.size.to_f / per_page.to_f).ceil

    @page = params[:page].try(:to_i) || 1

    @start = if @page < 2 || @page > @total
      0
    else
      (@page - 1) * per_page
    end


    @posts = @posts[@start, per_page]
    end
  end

  def photos
    @images = Dir.glob("public/uploads/*.*").map {|i| i.remove("public/")}
  end

  def upload
    uploader = ImageUploader.new
    image = params[:image]
    uploader.store!(image)

    redirect_to '/static_pages/photos'
  end
end
