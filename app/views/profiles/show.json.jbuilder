json.extract! @profile, :name, :user_id

json.followers @user.followers.each do |f|
  json.name f.name
end

json.followers_count @user.followers_count

json.if_current_user_follow current_user.following?(@user)

json.tweets @user.tweets.order("created_at desc").each do |t|
  json.message t.message
end
