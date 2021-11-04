class Forum < ApplicationRecord
  has_many :posts
  has_many :users, :through => :posts
  belongs_to :user
  validates :name, presence: true
  accepts_nested_attributes_for :posts

  scope :most_recent, -> { order(created_at: :desc) }
  scope :active, -> { where(status: true)}
  scope :by_popularity, -> { Forum.left_joins(:posts).group(:id).order("count(posts.forum_id) desc") }

  def d
    self.created_at.strftime("%m/%d/%Y, %I:%M%p")
  end
end
