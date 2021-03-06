class Admins::TrainingMenusController < ApplicationController
  before_action :authenticate_admin!
  def index
    @training_menu = TrainingMenu.new
    @training_menus = TrainingMenu.all
  end

  def edit
    @training_menu = TrainingMenu.find(params[:id])
  end

  def create
    @training_menu = TrainingMenu.new(training_menu_params)
    if  @training_menu.save
      redirect_to admins_training_menus_path
    else
      @training_menus = TrainingMenu.all
      render "index"
    end
  end

  def update
    @training_menu = TrainingMenu.find(params[:id])
    if  @training_menu.update(training_menu_params)
      redirect_to admins_training_menus_path
    else
      render "edit"
    end
  end

  def destroy
    training_menu = TrainingMenu.find(params[:id])
    training_menu.destroy
    redirect_to admins_training_menus_path
  end


  private
  def training_menu_params
    params.require(:training_menu).permit(:menu)
  end
end
