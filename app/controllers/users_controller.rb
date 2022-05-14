class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    id = params[:id]
    @user = User.find(id)
    @button_text = 'See all posts'
    @path = helpers.user_posts_path(params[:id])

    respond_to do |format|
      format.html { render layout: 'user_header' }
    end
  end
end
