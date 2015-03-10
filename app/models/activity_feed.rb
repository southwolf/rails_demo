class ActivityFeed < ActiveRecord::Base
  belongs_to :receiver, class_name: 'User'
  belongs_to :trigger_source, polymorphic: true

  after_create :notify_receiver

  def notify_receiver
    channel = receiver.becomes(User::Feed).channel
    UserFeedsController.publish(channel, trigger_source.jbuilder_render)
  end

end
