class HomesController < ApplicationController
	def home
	end

	def about
	end

	def bmi
	end

	def bmi_calculation
	  @height = params[:height].to_f / 100
	  @weight = params[:weight].to_f
	  @height_total = @height * @height
	  @calculation = @weight / @height_total
	end

	def community
	  if user_signed_in?
        @room = Room.new
        @rooms = current_user.rooms
        @nonrooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).pluck(:id))
      end
	end
end
