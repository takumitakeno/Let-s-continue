class Admin::UsersController < ApplicationController
	def index
	  @q = User.ransack(params[:q])
      @admin_users = @q.result(distinct: true)
	end

	def show
	end
end
