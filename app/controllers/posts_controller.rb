class PostsController < ApplicationController
  before_action :require_user!, only: [:new, :create, :edit, :update]
  before_action :require_author!, only: [:edit, :update]

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors4] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @author = @post.author
    render :edit
  end

  def update
    @post = Post.update(params[:id], post_params)
    if @post
      redirect_to post_url(@post)
    else
      flash.now[:errors5] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    Post.destroy(params[:id])
    redirect_back fallback_location: subs_url
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
  end

  def require_author!
    post = Post.find(params[:id])
    author = post.author
    redirect_to post_url(post) if current_user != author
  end
end
