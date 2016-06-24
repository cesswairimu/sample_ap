require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
@user = User.new(name: "example User", email: "user@example.com", 
					password: "foobar", password_confirmation: "foobar")
end

test "email addresses should be unique" do
duplicate_user = @user.dup
duplicate_user.email = @user.email.upcase
@user.save
assert_not duplicate_user.valid?
end

test "email addresses should be saved as lower-case" do
mixed_case_email = "Foo@ExAMPle.CoM"
@user.email = mixed_case_email
@user.save
assert_equal mixed_case_email.downcase, @user.reload.email
end

test "password should have a minimum length" do
	@user.password = @user.password_confirmation = "a" * 5
	assert_not @user.valid?
end
test "authenticated? should return false for a user with nil digest" do
	assert_not @user.authenticated?(:remember, '')
end



test "associated microposts should be destroyed" do
	@user.save
	@user.microposts.create!(content: "Lorem ipsum")
	assert_difference 'Micropost.count', -1 do
	@user.destroy
  end
 end
 test "should follow and unfollow a user" do 
 example = users(:example)
 lawrence = users(:lawrence)
 assert_not example.following?(lawrence)
 example.follow(lawrence)
 assert example.following?(lawrence)
 assert lawrence.followers.include?(example)
 example.unfollow(lawrence)
 assert_not example.following?(lawrence)
end

end

