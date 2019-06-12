class UsersController < ApplicationController

  before_action :find_user, only: %i[show update delete]

  def show
    render json: @user
  end

  def index
    @reports = User.find_by(id: params[:id]).reports
    render json: @reports
  end

  def create
    user = User.new(user_params)
    if user.save

      user_id = user.id
      token = encode_token(user_id)
      render json: { user: UserSerializer.new(user), token: token }, status: 201
    else
      render json: { errors: 'beep boop beep bop' }
    end
  end

  # def update
  #
  # end
  #
  # def delete
  #
  # end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

end
