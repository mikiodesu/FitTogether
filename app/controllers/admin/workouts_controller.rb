class Admin::WorkoutsController < Admin::BaseController
  before_action :set_workout, only: [:destroy]

  def index
    @workouts = Workout.all
  end

  def destroy
    @workout.destroy
    redirect_to admin_workouts_path, notice: "投稿を削除しました"
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end
end

