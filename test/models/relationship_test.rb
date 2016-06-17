require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
  	@relationship =Relationship.new(follower_id: 1, followed_id: 2)
  end
  test "should be valid " do 
  	assert @relationship.valid?
  end
  test "should require a follower_id" do 
  	assert_not @relationship.valid?
  end
  test "should require a followed_id" do 
  	@relationship.followed_id = nil
  	assert_not @relationship.valid?
  end
  test "should follow and unfollow a user" do  
  	Example = users(:Example)
    Lawrence = users(:Lawrence)
    assert_not Example.following?(Lawrence)
    Example.follow(Lawrence)
    assert Example.following?(Lawrence)
    assert Lawrence.followers.include?(Example)
    Example.unfollow(Lawrence)
    assert_not Example.following?(Lawrence)
end
test "should be followed and unfollowed" do 
	end


end
