class AddUserIdToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :user_id, :integer
  end
end
