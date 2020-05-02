class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = User.ransack(params[:q])
    @admin_users = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:taggings)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admins_users_path
  end
end
