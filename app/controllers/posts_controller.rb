require 'yaml'
class PostsController < ApplicationController
  def index
    @user = User.find(id)
    @button_text = 'Pagination'
    @path = helpers.user_post_path(id:)

    render layout: 'user_header'
  end

  def show
    @post = Post.where(author: id).find(params[:id])
  end

  private

  def id
    params[:user_id]
  end
end
