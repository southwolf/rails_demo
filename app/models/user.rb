class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_followable
  acts_as_follower

  has_one :profile
  has_many :tweets
  has_many :activity_feeds, foreign_key: :receiver_id

  delegate :name, to: :profile
  after_create {create_profile}

  def self.create_test_user(email = 'ray@test.com')
    create!(email: email, password: 'asdfasdf', password_confirmation: 'asdfasdf')
  end

  def followers
    followers_by_type('User')
  end

  def tweet_feeds_ids
    activity_feeds.where(trigger_source_type: 'Tweet').pluck(:trigger_source_id)
  end

  def tweets_in_home
    tweet_table = Tweet.arel_table
    query = tweet_table[:id].in(tweet_feeds_ids).or(tweet_table[:user_id].eq(id))
    Tweet.where(query).order("created_at desc")
  end

end
