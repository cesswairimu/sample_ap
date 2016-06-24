require 'test_helper'
def setup
  ActionMailer::Base.deliveries.clear
end

class UsersSignupTest < ActionDispatch::IntegrationTest
   test "invalid signup information" do
   	get signup_path
    assert_difference 'User.count' do
    	post_via_redirect users_path, user: { name: "example User", 
    							email: "user@example.com", 
    							password: "password", 
    							password_confirmation: "password" }

  end
end

  test "valid signup information with account activation" do
  get signup_path
  assert_difference 'User.count', 1 do
	post users_path, user: { name: "Example User",
							                email: "user@example.com",
							                password:              "password",
							                password_confirmation: "password" }
end

   #assert_template 'users/show'
   #assert is_logged_in?
end
end

