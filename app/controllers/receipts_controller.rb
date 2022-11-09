class ReceiptsController < ApplicationController

  def new
    @receipt = Receipt.new
    @user = current_user
    render :new
  end

  def create
    receipt = Receipt.new(receipt_params)
    receipt.user_id = current_user.id
    if receipt.save
      redirect_to user_receipts_url
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
  def receipts_params
    params.require(:receipt).permit(:name, :total, :user_id, :group_id, :date)
  end
end