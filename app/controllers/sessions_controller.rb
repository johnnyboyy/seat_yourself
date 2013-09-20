class SessionsController < ApplicationController
	skip_before_filter :require_login, except: :destroy

	def new
		@user = User.new
		# if sessions[:user_id] != nil
		# redirect_to restaurants_url
		# end
	end

	def create

		respond_to do |format|
			if @user = login(params[:email], params[:password])
				format.html { redirect_back_or_to(:users, notice: 'Login successful')}
				format.xml { render xml: @user, status: :created, location: @user}
			else
			format.html { flash.now[:alert] = "Login failed"; render action: "new"}
			format.xml { render xml: @user.errors, status: :unprocessable_entity}
			end
		end
	end

	def destroy
		logout
		redirect_to(:root, notice: "Logged out")
	end
	
end
