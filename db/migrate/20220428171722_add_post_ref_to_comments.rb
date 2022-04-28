class AddPostRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :postId, null: false, foreign_key: true
  end
end
