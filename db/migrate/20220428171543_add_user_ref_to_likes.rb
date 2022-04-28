class AddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :authorId, null: false, foreign_key: true
  end
end
