class AddStatsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :fav_exercise, :string
    add_column :users, :gym, :string
  end
end
