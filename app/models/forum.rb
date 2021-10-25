class Forum < ApplicationRecord
  has_many :posts
  has_many :users, :through => :posts
  belongs_to :user
  validates :name, presence: true
  accepts_nested_attributes_for :posts

  def d
    self.created_at.strftime("Created %m/%d/%Y, %I:%M%p")
  end
end
