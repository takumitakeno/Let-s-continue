class PostsController < ApplicationController
	def index
	  @posts = Post.all
	  # @user = current_user.id
	end

	def new
	  @post = Post.new
	  @user = current_user
	end

	def show
	  @post = Post.find(params[:id])
	end

	def create
	  post = Post.new(post_params)
	  post.user_id = current_user.id
	  post.save
	  redirect_to posts_path
	end

	private
	def post_params
        params.require(:post).permit(:posts, :profile_image)
    end

end

