class ActivityFeed < ActiveRecord::Base
  belongs_to :receiver, class_name: 'User'
  belongs_to :trigger_source, polymorphic: true
end
