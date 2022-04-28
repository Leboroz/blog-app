class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :postId, null: false, foreign_key: true
  end
end
