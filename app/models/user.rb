class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_followable
  acts_as_follower

  has_one :profile
  has_many :tweets
  delegate :name, to: :profile
  after_create {create_profile}

  def self.create_test_user(email = 'ray@test.com')
    create!(email: email, password: 'asdfasdf', password_confirmation: 'asdfasdf')
  end


end
