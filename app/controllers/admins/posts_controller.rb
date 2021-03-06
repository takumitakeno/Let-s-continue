class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @q = Post.includes(:user, :taggings).ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def post_tags_index
    if params[:tag_name]
      @posts = Post.includes(:user, :taggings).tagged_with("#{params[:tag_name]}").page(params[:page]).per(10)
    else
      @posts = Post.includes(:user, :taggings).all.page(params[:page]).per(10)
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_messages = @post.post_messages
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admins_posts_path
  end
end
