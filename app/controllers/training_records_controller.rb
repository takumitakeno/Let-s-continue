class TrainingRecordsController < ApplicationController
	before_action :authenticate_user!

    def new
      @training_record = TrainingRecord.new
      @training_menus = TrainingMenu.all
    end

	def index
      @training_records = current_user.training_records
      @menus_id = []
      @menus_records =[]

      @training_records.each do |training_record|
        unless @menus_id.index(training_record.training_menu.id)
           @menus_id <<  training_record.training_menu.id
           @menus_records << training_record.training_menu
        end
      end
    end

    def show
      @training_record = TrainingRecord.find(params[:id])
      @training_records = TrainingRecord.where(user_id: current_user.id, training_menu_id: params[:id])
    end

    def create
      @training_record = TrainingRecord.new(training_menu_params)
      @training_record.user_id = current_user.id
      if @training_record.save
        redirect_to training_records_path
      else
        @training_menus = TrainingMenu.all
        render "new"
      end
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


