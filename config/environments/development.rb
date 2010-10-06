# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# RPX setup
config.after_initialize do
  RPXNow.api_key='cf09fd4fb185611d33e523e4bf0f3ab7302af2fd'
end
RPX_REALM='articley'

#ActionMailer::Base.delivery_method = :smtp

#ActionMailer::Base.smtp_settings = {
# :domain             => "ourpatch.com.au",
#  :perform_deliveries => true,
#  :address            => 'mail.spectrum.com.au',
#  :port               => 25 }
=begin
require 'smtp_tls'

ActionMailer::Base.server_settings = {
  :address => "smtp.gmail.com",
  :port => "587",
  :domain => "localhost.localdomain",
  :authentication => :plain,
  :user_name => "someusername",
  :password => "somepassword"
}
=end
