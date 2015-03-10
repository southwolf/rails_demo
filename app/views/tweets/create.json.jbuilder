json.extract! @tweet, :id, :message, :created_at, :updated_at

json.user do
  json.name @tweet.user.name
end