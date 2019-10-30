class AddDetailsToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :title, :string
    add_column :videos, :youtube_id, :string
    add_column :videos, :url, :string
    add_column :videos, :thumbnail, :string
  end
end
