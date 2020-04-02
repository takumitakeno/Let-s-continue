class Admin::UsersController < ApplicationController
	before_action :admin_user
	def index
	  @q = User.ransack(params[:q])
      @admin_users = @q.result(distinct: true).page(params[:page]).per(10)
	end

	def show
	  @user = User.find(params[:id])
	  @posts = @user.posts
	end

	def destroy
	  user = User.find(params[:id])
	  user.destroy
	  redirect_to admin_users_path
	end
	def admin_user
      redirect_to root_path unless current_user.admin?
    end
end
