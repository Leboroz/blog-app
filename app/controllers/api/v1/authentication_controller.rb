class Api::V1::AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login
  protect_from_forgery with: :null_session
  # POST /auth/login
  def login
    @user = User.find_by(email: params[:email])
    if @user&.valid_password?(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      render json: { token:, username: @user.name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
