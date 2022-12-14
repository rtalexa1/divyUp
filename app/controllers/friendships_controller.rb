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
      Friendship.create(
        user_id: params[:friend_id], 
        friend_id: current_user.id, 
        requester: false
        )
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def update
    friendship = Friendship.find_by(id: params[:id])
    friendship.accept!
    redirect_to user_url(current_user)
  end

  def destroy
    
  end

  private
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :accepted, :search)
  end
end