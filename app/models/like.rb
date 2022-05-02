class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increase_like_counter
    Post.find_by(id: post.id).update(likesCounter: post.likesCounter.nil? ? 1 : ++post.likesCounter)
  end
end
