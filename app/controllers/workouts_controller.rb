class WorkoutsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.create(workout_params)
    if @workout.valid?
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :scheduled_date, :scheduled_time, :video)
  end
end
