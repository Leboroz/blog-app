class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @post = Post.find(params[:post_id])
    text = comment_params[:text]
    @new_comment = Comment.new(post_id: @post.id, author_id: current_user.id, text:)
    respond_to do |format|
      format.json { render :json => @new_comment if @new_comment.save }
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
