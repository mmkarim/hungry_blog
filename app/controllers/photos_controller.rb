class PhotosController < ApplicationController
  def index
    @images = Dir.glob("public/uploads/*.*").map {|i| i.remove("public/")}
  end

  def upload
    uploader = ImageUploader.new
    image = params[:image]
    uploader.store! image

    redirect_to photos_index_path
  end
end
