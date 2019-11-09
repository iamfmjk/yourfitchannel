class AlterScheduledTimeForWorkouts < ActiveRecord::Migration[5.2]
  def change
    remove_column :workouts, :scheduled_date
    remove_column :workouts, :scheduled_time
    add_column :workouts, :scheduled_for, :datetime
  end
end
