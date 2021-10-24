class CreateForums < ActiveRecord::Migration[6.1]
  def change
    create_table :forums do |t|
      t.string :name
      t.datetime :created
      t.integer :user_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
