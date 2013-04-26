class GoalsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_group
  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all
    @active_goals = @group.active_goals
    @finished_goals = @group.finished_goals

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @goals }
      end
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal = @group.goals.new
    # @goal = Goal.new
    # @goal.group = @group

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    # @goal = Goal.new(params[:goal])
    @goal = @group.goals.new(params[:goal])

    respond_to do |format|
      if @goal.save
        format.html { redirect_to group_goal_path(@group, @goal), notice: 'Goal was successvol aangemaakt.' }
        format.json { render json: @goal, status: :created, location: @goal }
      else
        format.html { render action: "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to group_goal_path(@group, @goal), notice: 'Goal was successvol geupdate.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goals_url }
      format.json { head :no_content }
    end
  end

  def reset
    @goal = Goal.find(params[:id])
    @goal.completions.each do |completion|
      completion.destroy
    end
    @goal.active = true
    @goal.completed_on = nil
    if @goal.save
      redirect_to group_goal_path(@group, @goal), notice: 'Goal is successvol gereset.'
    else
      render action: "edit"
    end
  end
end

private
  def get_group
    if params[:goal_id].present?
      @group = Group.find(params[:id])
    elsif params[:group_id].present?
      @group = Group.find(params[:group_id])
    end
  end