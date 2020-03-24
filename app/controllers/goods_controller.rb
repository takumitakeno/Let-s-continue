class GoodsController < ApplicationController
	def create
		 @post = Post.find(params[:post_id])
         good = current_user.goods.new(post_id: @post.id)
         good.save
	end

	def destroy
		@post = Post.find(params[:post_id])
        good = current_user.goods.find_by(post_id: @post.id)
        good.destroy
	end
end



