class ApplicationController < ActionController::Base
  # TODO current_user, login_user, logout_user...

  def current_user
    # Placeholder
    User.first
  end
end
