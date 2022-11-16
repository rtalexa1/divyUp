class GroupsController < ApplicationController

  load_and_authorize_resource :group

  def index
    @groups = Group.all
    @user = current_user
    render :index
  end

  def show
    @group = Group.find_by(id: params[:id])
    @user = current_user
    
    if @group
      render :show
    else
      redirect_to user_groups_url
    end
  end
  
  def new
    @group = Group.new
    render :new
  end

  def create
    group = Group.new(group_params)
    group.user_id = current_user.id

    if group.save
      redirect_to user_groups_url(current_user)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def group_params
    params.require(:group).permit(:name, :user_id, :settled)
  end
end