class HomesController < ApplicationController
	def about
	end

	def bmi
	end

	def bmi_calculation
	  @height = params[:height].to_f / 100
	  @weight = params[:weight].to_f
	  @height_total = @height * @height
	  @calculation = @weight / @height_total
	  # binding.pry
	end
end
