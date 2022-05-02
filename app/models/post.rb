class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def increase_user_counter
    User.find_by(id: user.id).update(post_counter: user.post_counter.nil? ? 1 : ++user.post_counter)
  end

  def most_recent_comments
    comments[0, 5]
  end
end
