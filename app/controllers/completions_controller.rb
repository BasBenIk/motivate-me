class CompletionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_objects

  def create
    @completion = @user.completions.build(:goal_id => params[:goal_id])
    if @completion.save
      flash[:notice] = "Completed"
      complete_goal
      redirect_to group_goal_path(@group, @goal)
    else
      flash[:error] = "Unable to complete"
      redirect_to group_goal_path(@group, @goal)
    end
  end

  def destroy
    @completion = @user.completions.find(params[:id])
    @completion.destroy
    flash[:notice] = "Removed completion."
    redirect_to group_goal_path(@group, @goal)
  end

private
  def get_objects
    @group = Group.find(params[:group_id])
    @user = User.find(params[:user_id])
    @goal = Goal.find(params[:goal_id])
  end

  def complete_goal
    if @goal.users.count == @goal.completions.count
      @goal.active = false
      @goal.completed_on = Time.now
      @goal.save
    end
  end
end