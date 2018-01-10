class StaticPagesController < ApplicationController
  def home
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).includes(:tags).order(created_at: :desc).page params[:page]
    else
      @posts = Post.all.includes(:tags).order(created_at: :desc).page params[:page]
    end
  end
end
