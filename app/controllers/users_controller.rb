class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def signin
  	
  end


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:notice] = "Welcome #{@user.fname}"
  	redirect_to root_path
  	else
  		flash[:alert] = "there was a problem creating your account"	
  		redirect_to :back
  	end

  end


  def show
  	@user = User.find(params[:id])
  end


  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
  		flash[:notice] = "Your account was deleted successfully."
  	else
  	    flash[:alert] = "Oups! There was a problem deleting your account."
  	end
  	redirect_to root_path
  end


  def edit
  	@user = User.find(params[:id])
  end


  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:notice] = "Your account was updated successfully"
  	else
  	    flash[:notice] = "There was a problem updating your account"
    end	

	redirect_to user_path(@user)
  end
end












