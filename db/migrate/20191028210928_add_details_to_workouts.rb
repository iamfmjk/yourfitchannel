class AddDetailsToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :title, :string
    add_column :workouts, :scheduled_date, :date
    add_column :workouts, :scheduled_time, :time
    add_column :workouts, :duration, :string
  end
end
