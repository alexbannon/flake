class PostsController < ApplicationController
  def create
    user_helper
    @event = Event.find(params[:event_id])
    @user.posts.create(event_id: @event.id, post_content: params[:post][:post_content], image_url: params[:post][:image_url])
    redirect_to :back
  end
  def edit
    user_helper
    @event = Event.find(params[:event_id])
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_content: params[:post][:post_content], image_url: params[:post][:image_url])
    redirect_to event_path(params[:event_id])
  end
  def destroy
    Post.find(params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end
end
