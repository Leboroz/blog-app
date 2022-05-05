class CommentsController < ApplicationController
  def new
    comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: } }
    end
  end

  def create
    user = User.find(params[:user_id])
    post = user.posts.find(params[:post_id])
    values = params.require(:comment).permit(:text)
    @new_comment = Comment.new(author: user, post:, text: values[:text])
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
end
