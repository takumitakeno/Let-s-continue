class TrainingMenusController < ApplicationController
  before_action :authenticate_user!
  def index
    @training_records = TrainingRecord.includes(:training_menu).where(user_id: current_user, training_menu_id: params[:menu_id])
    @menu_index = {}

    @training_records.each do |training_record|
      unless training_record.weight == 0
        @menu_index[training_record.created_at.strftime('%Y/%m/%d')] = training_record.weight
      end
    end
  end
end
