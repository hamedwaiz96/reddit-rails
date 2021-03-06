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
    user = User.new(user_params)
    if user.save
      redirect_to new_session_url
    else
      flash.now[:errors] = ["Invalid Username or Password"]
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end
end
