class InvitationsController < ApplicationController

  def new
    @group = Group.find_by(id: params[:group_id])
    @friends = current_user.friends
    render :new
  end

  def create

  end

  def destroy

  end

  private
  def invitation_params
    params.require(:invitation).permit(:sender_id, :recipient_id, :group_id)
  end
end