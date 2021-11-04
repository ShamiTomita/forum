class AddCategoryAndStatusToForums < ActiveRecord::Migration[6.1]
  def change
    add_column :forums, :category, :string
    add_column :forums, :status, :boolean, default: true
  end
end
