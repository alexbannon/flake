class CommentsController < ApplicationController

  def create
    @comment = Comment.create(user_id: session[:user_id], post_id: params[:post_id], comment_content: params[:comment][:comment_content])
    redirect_to :back
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
