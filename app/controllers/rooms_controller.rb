class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order(created_at: :desc).limit(30)
    
  end
  def show
    @room = Room.find(params[:id])
    @chats = @room.chats.includes(:user)
  end

  def create
  	@room = Room.new(room_params)
    binding.pry
  	@room.save
  	current_user.user_rooms.create(room_id: @room.id)
  	redirect_to room_path(@room)
  end

private
  def room_params
    params.require(:room).permit(:name)
  end
end
