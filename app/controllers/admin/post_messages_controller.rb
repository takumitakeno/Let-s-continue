class Admin::PostMessagesController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    post_message = PostMessage.find(params[:id])
    post_message.destroy
    redirect_back(fallback_location: root_path)
  end
end
