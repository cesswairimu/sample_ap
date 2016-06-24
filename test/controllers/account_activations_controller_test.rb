require 'test_helper'

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  
  def edit
  	user =User.find_by(email: params[:email])
  	if user && !user.activated? && user.authenticated?(:activation, params[:id])
  		user.update_attribute(:activated,  true)
  		user.update_attribute(:activated_at, Time.zone.now)
  		log_in userflash[:success] = "Account Activated!!!"
  		redirect_to user
  	else
  		flash[:danger] = "Invalid Activation link"
  		redirect_to root_url
  	end
  end
end
