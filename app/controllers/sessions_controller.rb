class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:session][:username], params[:session][:password])
    if user
      login_user!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors1] = user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end

end
