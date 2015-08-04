class UsersController < ApplicationController
  skip_before_action :authorize, only: [:homepage, :create, :sign_in, :sign_in_page]
  def homepage
    if session[:user_id]
      redirect_to user_path(User.find(session[:user_id]))
      return
    else
      @user = User.new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render "homepage"
    end
    # if User.find_by(username: params[:user][:username])
    #   message = "Username already exists. Try another one."
    # else
    #   @user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], username: params[:user][:username], email: params[:user][:email], password_digest: BCrypt::Password.create(params[:user][:password].strip))
    #   session[:user_id] = @user.id
    #   redirect_to user_path(@user)
    #   return
    # end
    # flash[:message] = message
    # flash[:first_name] = params[:user][:first_name]
    # flash[:last_name] = params[:user][:last_name]
    # flash[:email] = params[:user][:email]
    # redirect_to :back
  end

  def signout
    reset_session
    redirect_to root_url
  end

  def sign_in
    if !User.find_by(username: params[:user][:username])
      message = "username not found."
    else
      @user = User.find_by(username: params[:user][:username])
      decoded_hash = BCrypt::Password.new(@user.password_digest)
      if decoded_hash.is_password?(params[:user][:password_digest]) == false
        message = "Your password's wrong!"
      else
        session[:user_id] = @user.id
        redirect_to :back
        return
      end
    end
    flash[:message] = message
    redirect_to "/sign_in_page"
  end

  def sign_in_page
  end

  def profile
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.password_digest != BCrypt::Password.new(params[:user][:password_digest])
      message = "Your password's wrong!"
    else
      @user.update()
    end
    flash[:message] = message
    flash[:first_name] = params[:user][:first_name]
    flash[:last_name] = params[:user][:last_name]
    flash[:email] = params[:user][:email]
    flash[:username] = params[:user][:username]
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
