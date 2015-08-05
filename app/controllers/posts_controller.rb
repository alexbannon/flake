class PostsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @event = Event.find(params[:event_id])
    @user.posts.create(event_id: @event.id, post_content: params[:post][:post_content], image_url: params[:post][:image_url])
    redirect_to :back
  end
end
