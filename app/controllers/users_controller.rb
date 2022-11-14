class UsersController < ApplicationController

  def show
    @sent_friend_requests = Friendship.where("user_id = ? AND accepted = false AND requester = true", current_user.id)
    @received_friend_requests = Friendship.where("friend_id = ? AND accepted = false AND requester = true", current_user.id)
    render :show
  end

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    user.password = (user_params[:password_digest])

    if user.save
      login_user!(user)
      redirect_to user_groups_url(user)
    else
      # flash error here
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :password_digest, :session_token)
  end
end