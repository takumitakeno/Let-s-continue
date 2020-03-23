class PostsController < ApplicationController
	def index
	  @posts = Post.all
	end

	def new
	  @post = Post.new
	  @user = current_user
	end

	def create
	  post = Post.new(post_params)
	  post.user_id = current_user.id
	  post.save
	  redirect_to posts_path
	end

	private
	def post_params
        params.require(:post).permit(:posts)
    end

end

