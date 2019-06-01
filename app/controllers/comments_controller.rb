class CommentsController < ApplicationController

  def new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash.now[:errors6] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @post = @comment.post
    render :show
  end

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :content, :parent_comment_id)
  end

end
