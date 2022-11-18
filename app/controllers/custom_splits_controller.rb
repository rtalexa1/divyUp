class CustomSplitsController < ApplicationController

  def index
    render :index
  end

  def show
    render :show
  end
  
  def new
    @group = Group.find_by(id: params[:group_id].to_i)
    @balances = @group.calculate_balances
    render :new
  end

  def create
    custom_split = CustomSplit.new(custom_split_params)
    

    if custom_split.save
      redirect_to custom_split_url(custom_split)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private
  def custom_split_params
    params.require(:custom_split).permit(:group_id, :total, :group_member_count)
  end
end