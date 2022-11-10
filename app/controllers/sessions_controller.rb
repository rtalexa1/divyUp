class SessionsController < ApplicationController

  before_action :require_no_user!, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_crendentials(
      params[:email], 
      params[:password]
    )

    if user.nil?
      flash.now[:errors] = "Incorrect email and/or password"
      render :new
    else
      login_user!(user)
      redirect_to user_groups_url
    end
  end

  def destroy

  end

end