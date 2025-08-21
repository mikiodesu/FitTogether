class Admin::DashboardController < Admin::BaseController
  def top
    @workouts = Workout.all
  end
end
