class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user

  def show
    render json: @user.posts
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :name, :email, :password, :password_confirmation
    )
  end
end
