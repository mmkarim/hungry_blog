class StaticPagesController < ApplicationController
  def home
    dynamic_method = params[:tag] ? [:tagged_with, params[:tag]] : [:all]
    @posts = Post.send(*dynamic_method).with_tags.page params[:page]
  end
end
