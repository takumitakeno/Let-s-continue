class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @posts = @room.posts
  end

  def create
  	@room = Room.new(room_params)
  	@room.save
  	current_user.user_rooms.create(room_id: @room.id)
  	redirect_to @room
  end

private
  def room_params
    params.require(:room).permit(:name)
  end
end
