class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :string
    add_column :users, :bio, :string
    add_column :users, :UpdatedAt, :datetime
    add_column :users, :createdAt, :datetime
    add_column :users, :postsCounter, :integer
  end
end
