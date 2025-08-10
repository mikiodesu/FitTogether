class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new(date: Date.today)
    3.times { @workout.workout_details.build }
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
      workout_details_attributes: [:exercise_name, :weight, :reps, :sets, :_destroy]
    )
  end


end
