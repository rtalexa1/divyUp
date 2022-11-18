class CustomSplitsController < ApplicationController

  def show
    render :show
  end
  
  def new
    @group = Group.find_by(id: params[:group_id].to_i)
    @balances = @group.calculate_balances
    render :new
  end

  def create

  end

  def edit

  end

  def update

  end

end