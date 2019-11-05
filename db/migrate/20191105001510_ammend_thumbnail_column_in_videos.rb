class AmmendThumbnailColumnInVideos < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :thumbnail, :standard_thumbnail
  end
end
