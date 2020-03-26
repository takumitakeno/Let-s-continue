class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
	  @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
	end
	def show
      @user = User.find(params[:id])
      @posts = @user.posts
	end

	def edit
	  @user = User.find(params[:id])
	end

	def update
	  user = User.find(params[:id])
      user.update(user_params)
      redirect_to root_path
	end
	private
	def user_params
		params.require(:user).permit(:user_name, :introduction, :profile_image)
	end
end
