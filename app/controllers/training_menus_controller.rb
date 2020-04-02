class TrainingMenusController < ApplicationController
	def index
	  @training_records = TrainingRecord.includes(:training_menu).where(user_id: current_user, training_menu_id: params[:menu_id])
	end
end
