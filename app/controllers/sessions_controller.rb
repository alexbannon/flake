class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Logged In!"
    else
      flash[:signin_message] = "Username or Password is Invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    # OR reset_session
    redirect_to root_url
  end
end
