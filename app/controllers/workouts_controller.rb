class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def new
    @workout = selected_video.workouts.new
  end


  def create
    @workout = selected_video.workouts.create(workout_params.merge(user_id: selected_video.user_id, duration: selected_video.duration))
    if @workout.valid?
      redirect_to user_workouts_path, success: 'New workout is scheduled!'
    else
      flash[:alert] = 'Workout can\'t be scheduled. Check the details below.'
      render :new
    end
  end

  def index
    @workouts = current_user.workouts.order(scheduled_for: :asc)
    @upcoming_workouts = current_user.workouts.where("scheduled_for >= ?", Time.current).order(scheduled_for: :asc)
    if params[:list]
      render 'workouts_list'
    else
      render 'index'
    end
  end

  def edit
    @workout = Workout.find_by_id(params[:id])
    if @workout.blank?
      return render plain: "Not found", status: :not_found
    end
    if @workout.user != current_user
      return render plain: "Unauthorized", status: :unprocessable_entity
    end
  end

  def update
    @workout = Workout.find_by_id(params[:id])
    if @workout.blank?
      return render plain: "Not found", status: :not_found
    end
    if @workout.user != current_user
      return render plain: "Not allowed", status: :unprocessable_entity
    end
    @workout.update_attributes(workout_params)
    if @workout.save
      flash[:notice] = "Workout has been updated."
      redirect_to user_workout_path(current_user, @workout)
    else
      flash[:alert] = "Workout can't be updated. CHeck the details below."
      return render :edit
    end
  end

  def show
    @workout = Workout.find_by_id(params[:id])
    if @workout.blank?
      flash[:alert] = "Requested workout is not found"
      return redirect_to user_workouts_path
    end
  end

  # def destroy
  # end

  helper_method :selected_video
  def selected_video
    selected_video = Video.find(params[:video_id])
  end

  private

  def workout_params
    params.require(:workout).permit(:video_id, :user_id, :title, :scheduled_for, :duration, :start_time)
  end
end
