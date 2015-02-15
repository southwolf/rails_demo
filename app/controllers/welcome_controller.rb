class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if current_user
      redirect_to home_profiles_path
    else
      redirect_to new_user_session_path
    end
  end
end
