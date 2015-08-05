class EventsController < ApplicationController

  def index
    @events = Event.all.order("event_time").limit(8)
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @event = Event.new
  end

  def create
    @user = User.find(params[:user_id])
    @event = Event.new(event_params)
    if @event.save
      puts "yay!"
      @user.attendances.create(event: @event)
      redirect_to root_url
    else
      puts "oh noes"
      puts @event
    end
  end

  def show
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
  end

  def users
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
    @users = @event.users
  end

  def join
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
    @event.attendances.create(user: @user)
    redirect_to :back
    return
  end

  private
  def event_params
    params.require(:event).permit(:title, :event_content, :event_image_url, :event_time)
  end

end
