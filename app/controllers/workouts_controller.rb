class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def new
    @selected_video = Video.find(params[:video_id])
    @workout = @selected_video.workouts.new
  end

  def create
    @selected_video = Video.find(params[:video_id])
    @workout = @selected_video.workouts.create(workout_params.merge(user_id: @selected_video.user_id, duration: @selected_video.duration))
    if @workout.valid?
      redirect_to user_workouts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @workouts = current_user.workouts
  end

  private

  def workout_params
    params.require(:workout).permit(:video_id, :user_id, :title, :scheduled_for, :duration, :start_time)
  end
end
