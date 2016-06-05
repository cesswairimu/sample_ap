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
end