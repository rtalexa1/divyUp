class GroupsController < ApplicationController

  def new
    render :new
  end

  def create
    group = Group.new(group_params)
    group.user_id = current_user.id
    if group.save
      redirect_to user_groups_url
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