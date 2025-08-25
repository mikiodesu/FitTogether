class WorkoutsController < ApplicationController
  def new
    @workout = Workout.new(date: Date.today)
    @workout.workout_details.build # 最初は1つだけ,空フォームを用意追加ボタンでJavaScriptがfields_forのhtmlを複製して挿入
  end

  def create
    @workout = current_user.workouts.new(workout_params)  
    if @workout.save
      flash[:notice] = "投稿に成功しました。"
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
    @workouts = current_user.workouts
  end

  def calendar_events
    workouts = current_user.workouts
  
    events = workouts.map do |w|
      {
        id: w.id,
        title: "✔",   # チェックマーク表示
        start: w.date # 投稿した日を開始日として渡す
      }
    end
  
    render json: events
  end

  private
  
  def workout_params
    params.require(:workout).permit(
      :date, :memo, :is_public,
      workout_details_attributes: [:id, :exercise_name, :bodypart,:weight, :reps, :sets, :_destroy]
    )
  end


end
