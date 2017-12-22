class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new post_params
    if @post.save!
      redirect_to post_path(@post)
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
