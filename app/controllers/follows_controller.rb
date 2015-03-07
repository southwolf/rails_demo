class FollowsController < ApplicationController
  def create
    if current_user.follow(get_following)
      render nothing: true
    else
      render json: "Error when following", status: 422
    end
  end

  def destroy
    if current_user.stop_following(get_following)
      render nothing: true
    else
      render json: "Error when following", status: 422
    end
  end
end
