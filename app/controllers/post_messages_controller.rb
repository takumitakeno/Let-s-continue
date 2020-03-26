class PostMessagesController < ApplicationController
	before_action :authenticate_user!
	def create
		@post = Post.find(params[:post_id])
        @post_message = PostMessage.new(post_message_params)
        @post_message.post_id = @post.id
        @post_message.user_id = current_user.id
        if @post_message.save
           @post_messages = @post.post_messages
        else
           @post_message = PostMssege.new
	       @post_messages = @post.post_messages
	       render :"posts/show"
        end
	end
	def destroy
		@post = Post.find(params[:post_id])
		@post_message = current_user.post_messages.find_by(id: params[:id])
		#renderした先でコメント一覧を表示させるためにメッセージ一覧を変数に格納する
		@post_messages = @post.post_messages
		@post_message.destroy
	end

	private
	def post_message_params
    params.require(:post_message).permit(:post_message)
    end
end
