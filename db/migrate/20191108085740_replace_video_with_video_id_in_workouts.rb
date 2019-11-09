class ReplaceVideoWithVideoIdInWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :video_id, :integer
    remove_column :workouts, :video
  end
end
