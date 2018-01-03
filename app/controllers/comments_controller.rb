class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy]
  before_action :find_post, only: [:index]

  def index
  end

  def create
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:email, :text, :post_id)
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
