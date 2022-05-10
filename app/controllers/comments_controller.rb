class CommentsController < ApplicationController
  def create
    author = User.find(params[:user_id])
    post = author.posts.find(params[:post_id])
    @new_comment = Comment.new(author:, post:, text: comments_params[:text])
    respond_to do |format|
      format.html do
        if @new_comment.save
          flash[:success] = 'comment saved successfully'
          redirect_to user_post_path(author.id, post.id)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
        end
      end
    end
  end

  def delete
    Comment.find(params[:id]).destroy
    redirect_to user_post_path(params[:user_id], params[:id])
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
