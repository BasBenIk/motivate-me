class HomeController < ApplicationController
  def index
    @goals = Goal.order("created_at DESC").limit(4)
    @users = User.all
  end
end
