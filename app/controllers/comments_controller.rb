class CommentsController < ApplicationController

  before_action :set_workout #動作前@workout定義
  before_action :authenticate_user!
  def create
    @comment = @workout.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @workout, notice: "コメントを投稿しました。"
    else
      redirect_to @workout, alert: "コメントを投稿できませんでした。"
    end
  end

  def destroy
    @comment = @workout.comments.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to @workout, notice: "コメントを削除しました。"
    else
      redirect_to @workout, alert: "削除権限がありません。"
    end
  end
  
  private

  def set_workout
    @workout = Workout.find(params[:workout_id]) # ネストしている場合
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
