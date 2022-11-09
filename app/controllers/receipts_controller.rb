class ReceiptsController < ApplicationController

  def index
    @receipts = Receipt.where(user_id: current_user.id)
    render :index
  end

  def new
    @receipt = Receipt.new
    @user = current_user
    render :new
  end

  def create
    receipt = Receipt.new(receipt_params)
    receipt.user_id = current_user.id
    if receipt.save
      redirect_to user_receipts_url(receipt.user_id)
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
  def receipt_params
    params.require(:receipt).permit(:name, :total, :user_id, :group_id, :date, :note)
  end
end