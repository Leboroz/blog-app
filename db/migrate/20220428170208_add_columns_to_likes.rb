class AddColumnsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :updatedAt, :datetime
    add_column :likes, :createdAt, :datetime
  end
end
