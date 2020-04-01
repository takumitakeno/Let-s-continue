class Admin::PostsController < ApplicationController
	before_action :admin_user
	def index
	  @q = Post.ransack(params[:q])
      @posts = @q.result(distinct: true)
	end

	def post_tags_index
	  if params[:tag_name]
	    @posts = Post.tagged_with("#{params[:tag_name]}")
	  else
	    @posts = Post.all
	  end
	end

	def show
	  @post = Post.find(params[:id])
	  @post_messages = @post.post_messages
	end

	def destroy
	  post = Post.find(params[:id])
	  post.destroy
	  redirect_to admin_posts_path
	end

	private
	def admin_user
      redirect_to root_path unless current_user.admin?
    end
end
