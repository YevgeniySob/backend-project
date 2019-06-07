class UsersController < ApplicationController

  before_action :find_user, only: %i[show update delete]

  def show
    render json: @user
  end

  def index
    @reports = Report.all
    render json: @reports
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], password: params[:password], email: params[:email])
    if @user.save
      render json: @user
    else
      puts 'blah'
    end
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
