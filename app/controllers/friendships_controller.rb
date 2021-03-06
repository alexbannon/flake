class FriendshipsController < ApplicationController

  def create
    user_helper
    @friendship = @user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to root_url
    else
      flash[:message] = "Error adding friend"
      redirect_to root_url
    end
  end

  def destroy
    user_helper
    @friendship = @user.friendships.find_by(:friend_id => params[:id])
    @friendship.destroy
    redirect_to root_url
  end
end
