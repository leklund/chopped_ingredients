class AdminController < ActionController::Base
  before_action :require_login, unless: "Rails.env.test?"
  protect_from_forgery with: :exception

  include Clearance::Controller

  def index
  end
end

