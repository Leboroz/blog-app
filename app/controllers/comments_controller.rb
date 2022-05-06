class CommentsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    post = user.posts.find(params[:post_id])
    @new_comment = Comment.new(author: user, post:, text: comments_params[:text])
    respond_to do |format|
      format.html do
        if @new_comment.save
          flash[:success] = 'comment saved successfully'
          redirect_to user_post_path(user.id, post.id)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
        end
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
