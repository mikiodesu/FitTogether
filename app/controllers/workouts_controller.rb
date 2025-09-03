class WorkoutsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @workout = Workout.new(date: Date.today)
    @workout.workout_details.build # 最初は1つだけ,空フォームを用意追加ボタンでJavaScriptがfields_forのhtmlを複製して挿入
  end

  def create
    @workout = current_user.workouts.new(workout_params)  
    if @workout.save
      redirect_to workout_path(@workout.id)
    else
      @workout.workout_details.build 
      render :new
    end
  end

  def index
    @workouts = Workout.where(is_public: true)
                      .order(created_at: :desc)
                      .page(params[:page])
                      .per(10)
  end

  def show
    @workout = Workout.find(params[:id])
    @comment = Comment.new
     # 非公開投稿は他人がアクセスできない
     if !@workout.is_public && @workout.user != current_user
      redirect_to workouts_path, alert: "この投稿は非公開です"
    end
  end

  def edit
    @workout = Workout.find(params[:id])
    @workout.workout_details.build 
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to workout_path(@workout.id)
    else
      render :edit
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to workouts_path
  end


  def analysis
    @workouts = current_user.workouts.where(date: 1.week.ago..Date.today)

    @bodypart_counts = WorkoutDetail
      .where(workout: @workouts)
      .group(:bodypart)
      .sum('reps * sets')

    @chart_labels = WorkoutDetail.bodyparts.keys.map { |k| I18n.t("activerecord.attributes.workout_detail.bodypart_options.#{k}") }
    @chart_data = WorkoutDetail.bodyparts.keys.map { |k| @bodypart_counts[k.to_s] || 0 }
  end




  private
  
  def workout_params
    params.require(:workout).permit(
      :date, :memo, :is_public,
      workout_details_attributes: [:id, :exercise_name, :bodypart,:weight, :reps, :sets, :_destroy]
    )
  end

  def correct_user
    @workout = Workout.find(params[:id])
    redirect_to workouts_path unless @workout.user == current_user
  end


end
