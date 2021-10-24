class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :details
      t.integer :user_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

    end
  end
end
