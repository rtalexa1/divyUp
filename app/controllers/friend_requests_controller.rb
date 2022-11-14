class FriendRequestsController < ApplicationController

  def new
    @user = current_user
    @potential_friends = User.search(params[:search])
    render :new
  end

  def create

  end

  private
  def friend_request_params
    params.require(:friend_request).permit(:requester_id, :requestee_id, :accepted, :search)
  end
end