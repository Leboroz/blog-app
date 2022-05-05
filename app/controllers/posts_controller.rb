class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @button_text = 'Pagination'
    @path = helpers.user_posts_path(params[:user_id])

    render layout: 'user_header'
  end

  def show
    @post = Post.where(author: params[:user_id]).find(params[:id])
  end
end
