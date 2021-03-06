class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

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

  def destroy
    @post.destroy
    redirect_to root_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :tag_list)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
