class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  private
  def authenticate
    if !session[:user_id]
      flash[:message] = "You have to sign in to access that page!"
      redirect_to "/"
    end
  end
end
