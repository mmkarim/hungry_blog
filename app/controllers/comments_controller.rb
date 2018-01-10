class CommentsController < ApplicationController
  include JwtHelper

  respond_to :json

  before_action :find_post, only: [:index]

  def index
    respond_with @post.comments.map{|c| c.add_pretty_time}
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      respond_with(comment.add_pretty_time, location: comment)
    else
      respond_with(comment, status: :unprocessable_entity)
    end
  end

  def destroy
    if valid_jwt? params[:jwt]
      respond_with Comment.destroy(params[:id])
    else
      render json: "", status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:email, :text, :post_id)
  end

  def find_post
    @post = Post.find_by! id: params[:post_id]
  end
end
