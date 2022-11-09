class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      # login_user!(user)
      redirect_to user_groups_url
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :name)
  end

end