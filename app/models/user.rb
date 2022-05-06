class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true, length: { minimum: 3 }
  validates :photo, presence: true
  validates :bio, presence: true, length: { in: 5..300 }

  def most_recent_posts
    posts.order('created_at Desc').limit(3)
  end
end
