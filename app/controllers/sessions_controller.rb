class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    
  end

  def destroy

  end

  def session_params
    params.require(:session).permit(:username, :password, :session_token)
  end
end
