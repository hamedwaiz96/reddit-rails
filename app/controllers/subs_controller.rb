class SubsController < ApplicationController
  before_action :require_user!, only: [:new, :edit, :create, :update]
  before_action :require_mod!, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def new
    @user = current_user
    @sub = Sub.new
    render :new
  end

  def create
    sub = Sub.new(sub_params)
    if sub.save
      redirect_to sub_url(sub)
    else
      flash.now[:errors2] = sub.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    sub = Sub.update(params[:id], sub_params)
    if sub
      redirect_to sub_url(sub)
    else
      flash.now[:errors3] = sub.errors.full_messages
      render :edit
    end
  end


  def require_mod!
    sub = Sub.find(params[:id])
    moderator = User.find(sub.moderator_id)
    redirect_to subs_url if current_user != moderator
  end

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

end
