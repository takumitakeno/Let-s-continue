class HomesController < ApplicationController
	before_action :authenticate_user!, only:[:community]
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
      end
	end
end
