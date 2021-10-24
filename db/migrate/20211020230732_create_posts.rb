class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :comment

      t.integer :user_id
      t.integer :forum_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
