class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: "DESC")
  end


  private
  def user_params
    params.require(:user).permit(:name)
  end
end
