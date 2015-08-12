class CommentsController < ApplicationController

  def create
    # a more readable for of this statement would be:
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.create(post: @post, comment_content: params[:comment][:comment_content])

    @comment = Comment.create(user_id: session[:user_id], post_id: params[:post_id], comment_content: params[:comment][:comment_content])
    redirect_to :back
  end
  # new line here
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
