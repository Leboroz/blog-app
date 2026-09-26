class LikesController < ApplicationController
  def create
    author = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    @like = Like.new(author:, post:)
    respond_to do |format|
      format.html do
        @like.save
        redirect_to user_post_path(author.id, post.id)
      end
    end
  end
end
