class Admins::RoomsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @rooms = Room.all
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_back(fallback_location: root_path)
  end
end
