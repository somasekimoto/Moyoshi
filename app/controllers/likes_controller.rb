class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(post_id: @post.id)
    like.save
    render 'like.js.erb'
  end

  def unlike
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
    render 'unlike.js.erb'
  end

  private
  def set_variables
    @post = Post.find(params[:post_id])
    @id_name = "#like-link-#{@post.id}"
  end
end