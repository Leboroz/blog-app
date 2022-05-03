class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increase_comments_counter

  private

  def increase_comments_counter
    post.increment!(:commentsCounter)
  end
end
