class Forum < ApplicationRecord
  has_many :posts
  has_many :users, :through => :posts
  belongs_to :user
  validates :name, presence: true 
  accepts_nested_attributes_for :posts
end
