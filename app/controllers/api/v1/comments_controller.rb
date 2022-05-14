class Api::V1::CommentsController < ApplicationController
  before_action :set_post

  def create
    render json: request.raw_post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
