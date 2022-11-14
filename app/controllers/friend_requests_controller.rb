class FriendRequestsController < ApplicationController

  def index
    @user = current_user
    render :index
  end

  def new

  end

  def create

  end

  private
  def friend_request_params
    params.require(:friend_request).permit(:requester_id, :requestee_id, :accepted)
  end
end