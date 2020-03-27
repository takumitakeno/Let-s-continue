class Admin::TrainingMenusController < ApplicationController
	before_action :admin_user

	def index
	  @training_menu = TrainingMenu.new
	  @training_menus = TrainingMenu.all
	end

	def edit
	  @training_menu = TrainingMenu.find(params[:id])
	end

	def create
	  training_menu = TrainingMenu.new(training_menu_params)
	  binding.pry
	  training_menu.save
	  redirect_to admin_training_menus_path
	end

	def update
    end

    def destroy
    end


    private
    def training_menu_params
        params.require(:training_menu).permit(:training_manu)
    end
	def admin_user
      redirect_to root_path unless current_user.admin?
    end

    
end
