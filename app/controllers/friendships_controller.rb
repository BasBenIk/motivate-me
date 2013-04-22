class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if params[:friend_id] == current_user.id
      flash[:error] = "Forever alone."
      redirect_to users_path
    else
      if @friendship.save
        flash[:notice] = "Added friend."
        redirect_to users_path
      else
        flash[:error] = "Unable to add friend."
        redirect_to root_url
      end
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end