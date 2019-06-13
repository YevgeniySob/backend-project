class AuthController < ApplicationController

  def login
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      user_id = user.id
      token = encode_token(user_id)
      render json: { user: UserSerializer.new(user), token: token }, status: 201
    else
      render json: { errors: 'beep boop beep bop' }
    end
  end

  def auto_login
    if curr_user
      render json: curr_user
    else
      render json: { errors: 'Not Found' }
    end
  end
end

