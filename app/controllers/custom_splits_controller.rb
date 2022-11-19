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
    @custom_split = CustomSplit.new(custom_split_params)
    @custom_split.percentage_total = params[:percentages].values.map(&:to_i).sum
    @balances = CustomSplit.calculate_custom_balances(
      custom_split_params[:total].to_i, 
      params[:percentages]
      ) 
    
    if @custom_split.save
      flash[:balances] = @balances
      redirect_to custom_split_url(@custom_split)
    else
      flash[:message] = @custom_split.errors.full_messages[0]
      redirect_to controller: 'custom_splits', action: 'new', method: 'get', group_id: @custom_split.group_id
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