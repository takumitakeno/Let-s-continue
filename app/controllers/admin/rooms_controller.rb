class Admin::RoomsController < ApplicationController
	def index
	  @rooms = Room.all
	end

	def destroy
	  room = Room.find(params[:id])
	  binding.pry
	  room.destroy
	  redirect_back(fallback_location: root_path)
	end
end
