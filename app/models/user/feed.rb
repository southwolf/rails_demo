class User::Feed < User

  def channel
    "/user_#{id}_feed"
  end
end
