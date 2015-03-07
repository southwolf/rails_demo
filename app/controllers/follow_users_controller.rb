class FollowUsersController < FollowsController

  def get_following
    @following = User.find(params.require(:follow_user)[:following_id])
  end
end
