class Admin::Workouts::CommentsController < Admin::BaseController
  before_action :set_workout
  before_action :set_comment, only: [:destroy]

  def index
    @comments = @workout.comments
  end

  def destroy
    @comment.destroy
    redirect_to admin_workout_comments_path(@workout), notice: "コメントを削除しました"
  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_comment
    @comment = @workout.comments.find(params[:id])
  end
end
