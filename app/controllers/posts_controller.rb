class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def search
    @posts = Tweet.search(params[:keyword])
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
