class AccountActivationsController < ApplicationController
	def edit
		user = User.find_by(email: params[:email])
		if user && !user.activated? && user.authenticated?(:activation, params[:id])
			user.activate
			log_in userflash[:success] = "Account activated!!!"
			redirect_to user
		else
			flash[:danger] = "Invalis activation link"
			redirect_to root_url
		end
		
	end
end
