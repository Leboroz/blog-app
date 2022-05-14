class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  before_save :default_values

  ROLES = %i[admin user].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  def default_values
    self.role = 'user'
    self.photo = 'photo-test'
    self.post_counter = 0
  end

  def most_recent_posts
    posts.order('created_at Desc').limit(3)
  end

  def as_json(_options = {})
    super(only: %i[id name bio posts_counter])
  end
end
