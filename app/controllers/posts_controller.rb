class PostsController < ApplicationController
  before_action :authenticate_user!
  def post_tags_index
    if  params[:tag_name]
      @posts = Post.includes(:user, :taggings).tagged_with("#{params[:tag_name]}").page(params[:page]).per(10)
    else
      @posts = Post.includes(:user, :taggings).all.page(params[:page]).per(10)
    end
  end


  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def edit
    @post = Post.find(params[:id])
    if  @post.user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_messages = @post.post_messages
    @post_message = PostMessage.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if  @post.save
      redirect_to posts_path, notice: '投稿が完了しました。'
    else
      flash.now[:alert] = '投稿できませんでした'
      @user = current_user
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])
    if  @post.update(post_params)
      redirect_to post_path(@post), notice: '投稿内容をが更新しました。'
    else
      flash.now[:alert] = '投稿内容を更新できませんでした'
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:post, :training_image, :tag_list)
  end
end

