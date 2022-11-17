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
    @members = @group.members
    # Clean up the view - as little logic as possible there
    # Where do we store this logic? Model? Service? Procedure? Here?
    @individual_totals = if group_params.present?
      Group.divy(@group.total, group_params[:custom_percentages].to_h)
    else
      @group.even_split_hash
    end

    flash.now[:alert] = "Percentages must total 100 exactly" if !Group.is_one_hundred?(@individual_totals)
  
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
    return unless params[:group].present?
    params.require(:group).permit(:name, :user_id, :settled, :custom_percentages => {})
  end
end