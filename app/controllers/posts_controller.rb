class PostsController < ApplicationController
  def index
  	@posts = Post.where(user_id: params[:user_id])

  end

  def new
  end

  def show
  end

  def edit
  end
end
