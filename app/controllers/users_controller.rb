class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @sent_friend_requests = current_user.sent_friend_requests
    @received_friend_requests = current_user.received_friend_requests
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