class AddColumnsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :text, :string
    add_column :comments, :updatedAt, :datetime
    add_column :comments, :createdAt, :datetime
  end
end
