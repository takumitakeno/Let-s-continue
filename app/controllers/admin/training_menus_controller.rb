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
	  training_menu = TrainingMenu.find(params[:id])
	  training_menu.update(training_menu_params)
	  redirect_to admin_training_menus_path
    end

    def destroy
      training_menu = TrainingMenu.find(params[:id])
      training_menu.destroy
      binding.pry
      redirect_to admin_training_menus_path
    end


    private
    def training_menu_params
        params.require(:training_menu).permit(:menu)
    end
	def admin_user
      redirect_to root_path unless current_user.admin?
    end
end
