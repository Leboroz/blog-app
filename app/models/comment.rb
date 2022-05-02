class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def increase_comments_counter
    Post.find_by(id: post.id).update(commentsCounter: post.commentsCounter.nil? ? 1 : ++post.commentsCounter)
  end
end
