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
  		flash[:notice] = 
  	
  end

  def edit
  end
end
