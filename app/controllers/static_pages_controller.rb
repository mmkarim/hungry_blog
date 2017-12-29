class StaticPagesController < ApplicationController
  def home
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order(created_at: :desc).page params[:page]
    else
      @posts = Post.all.order(created_at: :desc).page params[:page]
    end
  end
end
