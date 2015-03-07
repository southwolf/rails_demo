class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :verified_request? # skip csrf token for json request
  before_action :authenticate_user!

  private

  # Skip protect_from_forgery when request is json
  def verified_request?
    if request.content_type == "application/json"
      true
    else
      super()
    end
  end

end
