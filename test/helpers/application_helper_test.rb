require 'test_helper'
class ApplicationHelpeerTest < ActionView::TestCase
	test "full_title_helper" do
		assert_equal full_title, "Ruby on rails Tutorial Sample App"
		assert_equal full_title("Help"), "Help | Ruby on rails Tutorial Sample App"
end
end