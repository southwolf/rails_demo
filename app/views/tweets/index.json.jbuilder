json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :message
  json.user do
    json.name tweet.user.name
  end
  json.url tweet_url(tweet, format: :json)
end
