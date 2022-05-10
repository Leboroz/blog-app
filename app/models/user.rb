class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  before_save :default_values

  Roles = [ :admin , :user, :guest ]

  def is?( requested_role )
    self.role == requested_role.to_s
  end

  def default_values
    self.role = 'user'
    self.photo = 'avatar'
    self.post_counter = 0
  end

  def most_recent_posts
    posts.order('created_at Desc').limit(3)
  end
end
