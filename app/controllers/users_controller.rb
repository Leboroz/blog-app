class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    id = params[:id]
    @user = User.find(id)
    @button_text = 'See all posts'
    @path = helpers.user_posts_path(id:)

    render layout: 'user_header'
  end
end
