ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
class ActiveSupport::TestCase
  
  fixtures :all

  
  def is_logged_in?
  	!session[:user_id].nil?
  end
  def full_title(page_title = '')
base_title = "Ruby on Rails Tutorial Sample App"
if page_title.empty?
base_title
else
	"#{page_title} | #{base_title}"
end
end
def log_in_as(user,options = {})
password = options[:password] || 'password'
remember_me = options[remember_me] || '1'
if integration_test?
	post login_path, session: {email: user.email,
								password: password,
								remember_me: remember_me }
	else
		session[:user_id] = user.id
	end
end
private
def integration_test?
	defined?(post_via_redirect)
end
end