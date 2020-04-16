class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @rooms = Room.all.order(created_at: :desc).limit(30)
  end
  def show
    @room = Room.find(params[:id])
    @chats = @room.chats.includes(:user)
  end

  def create
    @room = Room.new(room_params)
    if  @room.save
      current_user.user_rooms.create(room_id: @room.id)
      redirect_to room_path(@room)
    else
      @rooms = current_user.rooms
      render :"homes/community"
    end
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
  