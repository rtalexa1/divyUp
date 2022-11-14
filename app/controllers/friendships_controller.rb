class FriendshipsController < ApplicationController

  def new
    @user = current_user
    @potential_friends = User.search(params[:search])
    render :new
  end

  def create

  end

  private
  def friendship_params
    params.require(:friendship).permit(:requester_id, :requestee_id, :accepted, :search)
  end
end