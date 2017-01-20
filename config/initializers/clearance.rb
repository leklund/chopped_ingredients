Clearance.configure do |config|
  config.allow_sign_up = false
  config.mailer_sender = "ted@example.com"
  config.rotate_csrf_on_sign_in = true
  config.routes = false
  config.cookie_domain = ".basketingredients.com"
  config.redirect_url = "/admin"
end
