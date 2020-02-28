class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment
      respond_to do |format|
        format.json { render }
        format.html { redirect_to post_path(params[:post_id]) }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
