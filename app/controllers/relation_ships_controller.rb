class RelationShipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    follow = current_user.active_relationships.build(followed_id: params[:followed_id])
    follow.follower_id = current_user.id
    follow.save
  end

  def destroy
    @user = User.find(params[:followed_id])
    follow = current_user.active_relationships.find_by(followed_id: params[:followed_id])
    follow.destroy
  end
end
