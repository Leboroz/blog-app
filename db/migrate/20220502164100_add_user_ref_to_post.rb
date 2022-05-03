class AddUserRefToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author, references: :users, index: true, foreign_key: { to_table: 'users'}
  end
end
