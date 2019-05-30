class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create

  end

  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end
end
