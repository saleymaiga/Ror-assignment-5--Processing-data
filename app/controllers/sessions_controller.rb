class SessionsController < ApplicationController
  def new
  end

  def create
  	 @user = User.find_by_email(params[:session][:email])
	 if @user && @user.password == params[:password]
	    session[:user_id] = @user.id
	    flash[:notice] = "welcome #{@user.fname}"

	    redirect_to user_path
	 else
	 	flash[:alert] = "There was a problem signing you in. Please sign up if you don't have an account"
		redirect_to "users/new"
	 end

  	
  end

  def destroy
  	
  end

  def signin
  	
  end
end
