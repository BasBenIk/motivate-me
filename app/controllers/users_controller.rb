class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @friendship = current_user.friendships.where(:friend_id => @user.id).first
  end

  def edit
    @user = User.find(params[:id])
  end

  def goals
    @user = User.find(params[:user_id])
    @goals = @user.goals
  end

end
