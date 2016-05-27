require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Ruby on rails Tutorial Sample App" 
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Ruby on rails Tutorial Sample App"
  end
  test "should get about" do
  	get :about
  	assert_response :success
  	assert_select "title", "About | Ruby on rails Tutorial Sample App"
  end
  	test "should get contact" do
  	get :contact
  	assert_response :success
  	assert_select "title", "Contact | Ruby on rails Tutorial Sample App"
  	#assert_select "h1, "Contact Me"

  end

  test "should get cv" do 
  	get :cv
  	assert_response :success
  	assert_select "title", "CV | Ruby on rails Tutorial Sample App"
  	assert_select "h1", "CURRICULUM VITAE"
  	assert_select "h2" , "PERSONAL PROFILE"
  	assert_select "td" , "Nationality"
  	assert_select "li", "Singing" 
  	assert_select "footer" ,"Copyright Ceciliah Wairimu @cessmbuguar@gmail.com"
  	assert_select "li", "Participating in charity programs"
  	# assert_select "footer", "Copyright Ceciliah Wairimu @cessmbuguar@gmail.com"

  	end


end