class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :baria_user, only:[:edit]
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

	def follows
    @user = User.find(params[:id])
    @users = @user.followings
    end

    def followers
    @user = User.find(params[:id])
    @users = @user.followers
    end

	private
	def user_params
		params.require(:user).permit(:user_name, :introduction, :profile_image)
	end

	def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
   end
end
