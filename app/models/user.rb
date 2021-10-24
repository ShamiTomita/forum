class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :threads, foreign_key:"user_id", class_name: "Forum"
  has_many :messages
  has_many :forums, :through => :posts, source: :forums

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
end
