class AddUserRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :authorId, null: false, foreign_key: true
  end
end
