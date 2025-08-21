class LikesController < ApplicationController
  def create
    @workout = Workout.find(params[:workout_id])
    current_user.likes.create(workout: @workout)
    respond_to do |format|
      format.html { redirect_to @workout }
      format.js
    end
  end

  def destroy
    @workout = Workout.find(params[:workout_id])
      current_user.likes.find_by(workout_id: @workout.id)&.destroy
      respond_to do |format|
        format.html { redirect_to @workout }
        format.js
      end
  end
end
