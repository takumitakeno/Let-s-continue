class RelationShipsController < ApplicationController
  before_action :authenticate_user!

  def create
    follow = current_user.active_relationships.build(followed_id: params[:followed_id])
    follow.follower_id = current_user.id
    # binding.pry
    follow.save
    redirect_to root_path
  end

  def destroy
    follow = current_user.active_relationships.find_by(followed_id: params[:followed_id])
    # binding.pry
    follow.destroy
    redirect_to root_path
  end
end
