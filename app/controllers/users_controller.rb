class UsersController < ApplicationController
  def index
  	@users = User.all
  end


  def new
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
  	redirect_to "/users"
  end


  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.where(id: params[:id]).first
  	if @user.update_attributes(params[:user])
  		flash[:notice] = "Your account was updated successfully"
  	else
  	    flash[:notice] = "There was a problem updating your account"	

  	
  end
end












