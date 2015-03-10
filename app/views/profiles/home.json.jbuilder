json.extract! current_user, :name, :id

json.channel current_user.becomes(User::Feed).channel