class LikesController < ApplicationController
  def create
    like = current_user.likes.new(workout_id: params[:workout_id])
    like.save
    redirect_to request.referer
  end

  def destroy
    like = current_user.likes.find_by(workout_id: params[:workout_id])
    like.destroy
    redirect_to request.referer
  end
end
