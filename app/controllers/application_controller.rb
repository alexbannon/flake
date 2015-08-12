class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize

  # a note on style, generally we put a blank line before 'private' / 'protected'
  # and then no blank line before the following methods, like so

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # why do this? `current_user` returns a user object, so I would just use (call)
  # current_user everywhere I wanted who was logged in.
  # (current_user is also more clearly named than `user_helper`)
  def user_helper
    @user = User.find(session[:user_id])
  end

  helper_method :user_helper

  helper_method :current_user

  def authorize
    if current_user.nil?
      flash[:message] = "Not Authorized. Signup or Signin First!"
      redirect_to root_url
    end
  end

end
