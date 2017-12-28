class StaticPagesController < ApplicationController
  def home
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).page params[:page]
    else
      @posts = Post.all.page params[:page]
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
