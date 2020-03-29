class TrainingRecordsController < ApplicationController
	before_action :authenticate_user!

    def new
     @training_record = TrainingRecord.new
     @training_menus = TrainingMenu.all
    end

	def index
     @training_records = TrainingRecord.where(user_id: current_user.id)
	end

    def show
     @training_record = TrainingRecord.find(params[:id])
    end

    def create
     training_record = TrainingRecord.new(training_menu_params)
     training_record.user_id = current_user.id
     training_record.save
     redirect_to training_records_path
    end

    def destroy
     training_record = TrainingRecord.find(params[:id])
     training_record.destroy
     redirect_to training_records_path
    end

	private
    def training_menu_params
        params.require(:training_record).permit(:weight, :rep, :training_menu_id)
    end
end
