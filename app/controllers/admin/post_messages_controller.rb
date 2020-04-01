class Admin::PostMessagesController < ApplicationController
	def destroy
		post_message = PostMessage.find(params[:id])
		post_message.destroy
		redirect_back(fallback_location: root_path)
	end
end
