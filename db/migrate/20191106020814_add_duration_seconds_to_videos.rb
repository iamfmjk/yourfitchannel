class AddDurationSecondsToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :duration, :integer
  end
end
