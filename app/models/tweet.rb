class Tweet < ActiveRecord::Base
  belongs_to :user

  def jbuilder_render
    c = ActionController::Base.new
    c.instance_variable_set '@tweet', self
    JSON.parse c.render_to_string('tweets/create.json', layout: false)
  end
end
