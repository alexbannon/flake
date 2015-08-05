class UsersController < ApplicationController
  skip_before_action :authorize, only: [:homepage, :create, :sign_in, :sign_in_page]
  def homepage
    if current_user
      redirect_to user_path(@current_user)
      return
    else
      @user = User.new
    end
  end

  def show
    @user = User.find(params[:id])
    @user_attendances = Attendance.where(user_id: @user.id)
    @events = Event.all.order("event_time")
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render "homepage"
    end
  end

  def profile
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user && @user.authenticate(params[:user][:password])
      @user.update(user_params)
      if @user.save
        redirect_to user_path(@user)
      else
        render "profile"
      end
    else
      flash[:message] = "Password is Invalid"
      render "profile"
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    if @user && @user.authenticate(params[:password])
      @user.destroy
      reset_session
      render "homepage"
    else
      flash[:message] = "Error deleting user. Try again"
      redirect_to :back
    end
  end



  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
