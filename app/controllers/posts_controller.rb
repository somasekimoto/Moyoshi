class PostsController < ApplicationController
  def index
    if params[:tag]
      @posts = Post.all.page(params[:page]).per(3).includes(:user).order('created_at DESC').tagged_with(params[:tag])
      
    else
      @posts = Post.all.page(params[:page]).per(3).includes(:user).order('created_at DESC')
      
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path, success: "投稿を作成しました"
    else
      render new_post_path, danger: "投稿に失敗しました"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :title, :genre_list).merge(user_id: current_user.id)
  end
end
