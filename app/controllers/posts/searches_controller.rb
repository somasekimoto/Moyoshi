class Posts::SearchesController < ApplicationController
  def index
    if params[:keyword].present?
      @posts = Post.search(params[:keyword]).page(params[:page]).per(3).all.includes(:user)
    end
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    @locations = Post.within_box(100000, latitude, longitude)
    unless @locations.empty?
      @center_point = [latitude, longitude]
      near_locations = @locations.sort_by{|l| l.distance_to(@center_point)}
      @posts = Kaminari.paginate_array(near_locations).page(params[:page]).per(3)
    else
      @posts = Post.all.page(params[:page]).per(3).includes(:user)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
