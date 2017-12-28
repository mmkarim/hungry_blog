class StaticPagesController < ApplicationController
  def home
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
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
