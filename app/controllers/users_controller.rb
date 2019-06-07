class UsersController < ApplicationController
  
  before_action :find_user, only: [:show, :update, :delete]

  def show; end

  def create

  end

  def update

  end

  def delete

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

end
