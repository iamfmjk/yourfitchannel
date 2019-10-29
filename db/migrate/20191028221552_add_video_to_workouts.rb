class AddVideoToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :video, :string
  end
end
