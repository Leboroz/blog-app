class Api::V1::PostsController < ApplicationController
  before_action :set_post

  def show
    render :json => @post.comments
  end

  private 

  def set_post
    @post = Post.find(params[:id])
  end
end
