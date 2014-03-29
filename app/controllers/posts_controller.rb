class PostsController < ApplicationController
  

  def index
  	@user =User.find(params[:user_id])
  	@posts = Post.where(user_id: params[:user_id])

  end

  def show
  	@post = Post.find(params[:id])
  	
  end

  def new
  	@post = Post.new
  	@user = User.find(params[:user_id])
  end

  def create
  	@post = Post.new(params[:post])
  	@post.user_id = params[:user_id]
  	if @post.save
  		flash[:notice] = "Post was created successfully"
  		redirect_to user_post_path(@post.user, @post)
  	else
  		flash[:notice]= "There was a problem creating that post"
  		redirect_to new_user_post_path(@post.user)
  	end
  
  end

  def posts
  	@posts = Post.all 
  	
  end


  def destroy
  	@post= Post.find(params[:id])
  	if @post.destroy
  	   flash[:notice] = "Your post  was deleted successfully"
  	   redirect_to user_posts_path(@post.user)
    else
       flash[:notice] = "There was a problem deleting the post "
       redirect_to :back
    end

  	
  end


  def edit
  	@post = Post.find(params[:id])

  end

  def update
  	@post= Post.find(params[:id])
  	if  @post.update_attributes(params[:post])
  		flash[:notice] = "Your post was updated successfully"    
  	else
  		flash[:notice] = "There was a problem editig that post"
  	end
  	redirect_to  user_post_path(@post.user, @post)
  end
  


end
