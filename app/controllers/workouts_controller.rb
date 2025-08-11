class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new(date: Date.today)
    @workout.workout_details.build # 最初は1つだけ,空フォームを用意追加ボタンでJavaScriptがfields_forのhtmlを複製して挿入
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    @workout.save
    redirect_to workouts_path
  end

  def index
    @workouts = Workout.where(is_public: true).order(created_at: :desc)
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def edit
    @workout = Workout.find(params[:id])
    @workout.workout_details.build if @workout.workout_details.empty?
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.update(workout_params)
    redirect_to workouts_path
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to workouts_path
  end

  private
  
  def workout_params
    params.require(:workout).permit(
      :date, :memo, :is_public,
      workout_details_attributes: [:id, :exercise_name, :bodypart,:weight, :reps, :sets, :_destroy]
    )
  end


end
