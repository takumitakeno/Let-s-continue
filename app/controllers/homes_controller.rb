class HomesController < ApplicationController
	def about
	end

	def bmi
	end

	def bmi_calculation
	  @height = params[:height].to_f
	  @weight = params[:weight].to_f
	  # @calculation = @weight/@height
	  binding.pry
	end
end
