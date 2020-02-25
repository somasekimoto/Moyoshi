class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user)
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
    redirect_to root_path, success: "投稿を更新しました。"
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path, success: '投稿を削除しました。'
    else 
      flash.now[:fail] = '削除に失敗しました。'
      render post_path(@post)
    end
  end

  def search
    @posts = Post.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :title).merge(user_id: current_user.id)
  end
end
