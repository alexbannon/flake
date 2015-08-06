class FriendshipsController < ApplicationController

  def create
    user_helper
    @friendship = @user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:message] = "Added friend"
      redirect_to root_url
    else
      flash[:message] = "Error adding friend"
      redirect_to root_url
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:message] = "Successfully destroyed friendship"
    redirect_to root_url
  end
end
