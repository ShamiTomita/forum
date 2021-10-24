# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :user_keys =>
  ["username", "password", "email"],
  :users => [
    ["Spongebob 'Anchor Arms' Squarepants", "BikiniBottomBoy", "sskrustykrab@clams.com"]
  ]
}

def main
  make users
  user = User.new(username: "Bob", email: "bob@gmail.com", password: "123")
  user.save
  f = Forum.new(name: "New Forum", user_id: user.id)
  f.save
  p = Post.new(comment: "Hi diddly doo", user_id: user.id, forum_id: f.id)
  p.save
  becky = User.new(username: "Becky", email:"doodoo@gmail.com", password:"123")
  becky.save
  becky_post = Post.new(comment:"baby please", user_id:becky.id, forum_id:f.id)
  becky_post.save
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end
