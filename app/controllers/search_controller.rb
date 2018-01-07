class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @post_results = []
    else
      # @post_results = Post.search(params[:q]).page(params[:page])
      @post_results = []
    end
  end
end
