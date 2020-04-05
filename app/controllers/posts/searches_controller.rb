class Posts::SearchesController < ApplicationController
  def index
    if params[:keyword].present?
      @posts = Post.search(params[:keyword]).page(params[:page]).per(3).all.include(:user)
    end
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @locations = Post.within_box(10000, latitude, longitude)
    if @locations.empty?
      @posts = @locations.page(params[:page]).per(3).all.includes(:user)
    else
      @posts = Post.all.page(params[:page]).per(3).includes(:user)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
