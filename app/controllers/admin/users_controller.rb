class Admin::UsersController < ApplicationController
	before_action :admin_user
	def index
	  @q = User.ransack(params[:q])
      @admin_users = @q.result(distinct: true)
	end

	def show
	  @user = User.find(params[:id])
	  @posts = @user.posts
	end
	def admin_user
      redirect_to root_path unless current_user.admin?
    end
end
