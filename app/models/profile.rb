class Profile < ActiveRecord::Base
  belongs_to :user

  def name
    read_attribute(:name) || user.email.sub("@", "-")
  end
end
