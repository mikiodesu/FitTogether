class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params)
    comment.workout_id = params[:workout_id]
    comment.save
    redirect_to request.referer
  end

  def destroy
    Comment.find_by(id: params[:id], workout_id: params[:workout_id]).destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
