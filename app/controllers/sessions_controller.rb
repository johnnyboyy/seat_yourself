class SessionsController < ApplicationController
	skip_before_filter :require_login, except: :destroy

	def new
		@user = User.new
		# if sessions[:user_id] != nil
		# redirect_to restaurants_url
		# end
	end

	def create

		if @user = login(params[:email], params[:password])
			redirect_to :root, notice: "Logged in!"
		else
			render 'new'
		end
	end

	def destroy
		logout
		redirect_to(:root, notice: "Logged out")
	end
	
end
