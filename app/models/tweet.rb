class Tweet < ActiveRecord::Base
  belongs_to :user

  after_create :tweets_feed

  def tweets_feed
    channel = '/tweets'
    UserFeedsController.publish(channel, jbuilder_render)
  end

  def jbuilder_render
    c = ActionController::Base.new
    c.instance_variable_set '@tweet', self
    JSON.parse c.render_to_string('tweets/create.json', layout: false)
  end
end
