class FriendshipsController < ApplicationController

  def new
    @potential_friends = User.search(params[:search])
    @potential_friends = @potential_friends.excluding(current_user) unless @potential_friends.nil?
    render :new
  end

  def create
    friendship = Friendship.new(friend_id: params[:friend_id])
    friendship.user_id = current_user.id
    if friendship.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  private
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :accepted, :search)
  end
end