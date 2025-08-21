class Admin::WorkoutCommentsController < Admin::BaseController
  def index
    @workout = Workout.find(params[:workout_id])
    @comments = @workout.comments
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: admin_workouts_path, notice: "コメントを削除しました")
  end
end