class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create, :destroy]
	def show
		@user = User.find(params[:id])
		if @user.restaurant_owner
			@owned_restaurants = []
			@owned_restaurants |= Restaurant.where(owner_id: @user.id)
		end
	end
	
	def new
		@user = User.new
	
	  respond_to do |format|
	    format.html # new.html.erb
	    format.json { render json: @users }
	  end
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def create
		@user = User.new(user_params)
	
	  respond_to do |format|
	    if @user.save
	    	auto_login(@user)
	      format.html { redirect_to :root , notice: 'user was successfully created.' }
	      format.json { render json: @user, status: :created, location: @user }
	    else
	      format.html { render action: "new" }
	      format.json { render json: @user.errors, status: :unprocessable_entity }
	    end
	  end
	end
	
	def update
		@user = User.find(params[:id])
	
	  respond_to do |format|
	    if @user.update(user_params)
	      format.html { redirect_to @user, notice: 'user was successfully updated.' }
	      format.json { head :no_content }
	    else
	      format.html { render action: "edit" }
	      format.json { render json: @user.errors, status: :unprocessable_entity }
	    end
	  end
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
	
	  respond_to do |format|
	    format.html { redirect_to :root }
	    format.json { head :no_content }
	  end
	end
	
	def user_params
		params.require(:user).permit( :username, :email, :password, :restaurant_owner)
	end
	
end
