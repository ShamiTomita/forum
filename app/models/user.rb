class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :threads, foreign_key:"user_id", class_name: "Forum"
  has_many :messages
  has_many :forums, :through => :posts, source: :forums
  has_one_attached :avatar
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.username = auth.info.name
      user.email = auth.info.email
      user.password = SecureRandom.hex
    end
  end

end
