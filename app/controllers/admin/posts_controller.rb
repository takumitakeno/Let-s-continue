class Admin::PostsController < ApplicationController
	def index
		@q = Post.ransack(params[:q])
        @posts = @q.result(distinct: true)
	end

	def show
	end
end
