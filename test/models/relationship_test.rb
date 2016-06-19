require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    example = users(:example)
    lawrence = users(:lawrence)
  	@relationship =Relationship.new(follower_id: example.id, followed_id: lawrence.id)
  end
  test "should be valid " do 
    # binding.pry
  	assert @relationship.valid?
  end
  test "should require a follower_id" do 
    @relationship.follower_id = nil
  	assert_not @relationship.valid?
  end
  test "should require a followed_id" do 
  	@relationship.followed_id = nil
  	assert_not @relationship.valid?
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
test "should be followed and unfollowed" do 
	end


end
