require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:Example)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
  assert_select 'input[type=text]'
      post microposts_path, micropost: { content: "" }
      assert_select 'div#error_explanation'
    content = "This micropost really ties the room together"
    picture = fixture_file_upload('test/fixtures/rails.png', 'image/png')
    assert_difference 'Micropost.count', 1 do
      post microposts_path, micropost: { content: content, picture: picture }
    end
    assert picture.picture?
    follow_redirect!
    assert_match content, response.body
    assert_select 'a',  'delete'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    get user_path(users(:Lawrence))
    assert_select 'a', text: 'delete', count: 0
  end
  test "micropost sidebar count" do
    log_in_as(@user)
    get root_path
    assert_match "#{Example} microposts", response.body
    other_user = users(:Lawrence)
    log_in_as(other_user)
    get root_path
    assert_match "0 microposts", response.body
    other_user.microposts.create!(content: "A micropost")
    get root_path
    assert_match Lawrence, response.body
end
end
