class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :increase_user_counter

  validates :author, presence: true
  validates :title, presence: true, length: { in: 3..250 }
  validates :text, presence: true, length: { in: 3..300 }

  def default_values
    self.likesCounter = 0
    self.commentsCounter = 0
  end

  def most_recent_comments
    comments.order('created_at Desc').limit(5)
  end

  private

  def increase_user_counter
    author.increment!(:post_counter)
  end
end
