class PostsController < ApplicationController
  load_and_authorize_resource

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: } }
    end
  end

  def create
    user = User.find(params[:user_id])
    @new_post = Post.new(author: user, title: post_params[:title], text: post_params[:text], likesCounter: 0,
                         commentsCounter: 0)
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
    @posts = @user.posts.includes(:comments)
    @button_text = 'Pagination'
    @path = helpers.user_posts_path(params[:user_id])

    render layout: 'user_header'
  end

  def show
    @post = Post.where(author: params[:user_id]).find(params[:id])
  end

  def delete
    Post.find(params[:post_id]).destroy
    redirect_to user_posts_path(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
