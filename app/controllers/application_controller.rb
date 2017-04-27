class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Clearance::Controller

  before_action :cache_control

  def cache_control
    expires_in 1.day, public: true, must_revalidate: true
    request.session_options[:skip] = true
  end
end
