class TrainingMenusController < ApplicationController
	def index
		# binding.pry
		@training_records = TrainingRecord.where(user_id: current_user, training_menu_id: params[:menu_id])
	end
end