class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increase_like_counter

  validates :author, presence: true
  validates :post, presence: true

  private

  def increase_like_counter
    post.increment!(:likesCounter)
  end
end
