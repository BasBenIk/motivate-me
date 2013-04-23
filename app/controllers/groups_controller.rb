class GroupsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :has_friends?, :only => [:new,:create]

  def leave
    @group = Group.find(params[:id])
    if @group.owner == current_user
      flash[:error] = "Je kunt je eigen groep niet verlaten"
      redirect_to @group
    else
      @group.users.delete(current_user)
      redirect_to groups_path
    end
  end

  # GET /groups
  # GET /groups.json
  def index
    @my_groups = Group.where(:owner_id => current_user.id)
    @other_groups = current_user.groups

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])

    unless @group.owner == current_user || @group.users.include?(current_user) || current_user.admin
      redirect_to groups_path
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @group }
      end
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new
    @friends = current_user.friends

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
    unless @group.owner == current_user || current_user.admin
      redirect_to groups_path
    else
      @friends = current_user.friends
    end
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])
    @group.owner = current_user

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])
    unless @group.owner == current_user || current_user.admin
      redirect_to groups_path
    else
      respond_to do |format|
        if @group.update_attributes(params[:group])
          format.html { redirect_to @group, notice: 'Group was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    unless @group.owner == current_user || current_user.admin
      redirect_to groups_path
    else
      @group.destroy
    end

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end


  def has_friends?
    unless current_user.friends.any?
      flash[:error] = "Je moet vrienden hebben om een groep te starten."
      redirect_to users_path # halts request cycle
    end
  end
end
