class Admin::RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user
  def index
    @rooms = Room.all
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
