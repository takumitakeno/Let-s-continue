class PostMessagesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
        @post_message = PostMessage.new(post_message_params)
        @post_message.post_id = @post.id
        @post_message.user_id = current_user.id
        # binding.pry
        if @post_message.save
          @post_messages = @post.post_messages
        end
	end
	def destroy
		# binding.pry
		@post = Post.find(params[:post_id])
		@post_message = current_user.post_messages.find_by(id: params[:id])
		@post_messages = @post.post_messages
		@post_message.destroy
	end

	private
	def post_message_params
    params.require(:post_message).permit(:post_message)
    end
end
