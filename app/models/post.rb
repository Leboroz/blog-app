class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :increase_user_counter

  def most_recent_comments
    comments.order(created_at: desc).limit(5)
  end

  private

  def increase_user_counter
    author.increment!(:posts_counter)
  end
end
