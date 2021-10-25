class Post < ApplicationRecord
  belongs_to :user
  belongs_to :forum

  validates :comment, presence: true

  def forum_name
    f = Forum.find_by(id:self.forum_id)
    f.name
  end

  def username
    u = User.find_by(id:self.user_id)
    u.username
  end

  def d
    self.created_at.strftime("%m/%d/%Y, %I:%M%p")
  end

end
