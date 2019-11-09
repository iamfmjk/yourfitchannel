class AddDurationToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :duration, :time
  end
end
