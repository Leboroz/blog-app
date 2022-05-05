class PostsController < ApplicationController
  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    user = User.find(params[:user_id])
    post_values = params.require(:post).permit(:title, :text)
    @new_post = Post.new(author: user, title: post_values[:title], text: post_values[:text])
    respond_to do |format|
      format.html do
        if @new_post.save
          flash[:success] = 'post saved successfully'
          redirect_to user_posts_path(user.id)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new
        end
      end
    end
  end

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
