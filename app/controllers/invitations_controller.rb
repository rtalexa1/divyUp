class InvitationsController < ApplicationController

  def new
    @group = Group.find_by(id: params[:group_id])
    @friends = current_user.friends
    render :new
  end

  def create
    @group = Group.find_by(id: params[:group_id])
    @invitation = Invitation.new(
      group_id: @group.id, 
      sender_id: current_user.id, 
      recipient_id: params[:recipient_id]
      )

    if @invitation.save
      redirect_to new_group_invitation_url(@group)
    else
      redirect_to new_group_invitation_url(@group)
    end
  end

  def update
    @invitation = Invitation.find(params[:invitation][:id])
    @invitation.update(accepted: true)
    # If the invite is accepted successfully, create a new membership for the recipient

    redirect_to user_url(params[:id])
  end

  def destroy

  end

  private
  def invitation_params
    params.require(:invitation).permit(:sender_id, :recipient_id, :group_id, )
  end
end