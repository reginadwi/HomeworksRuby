class AddCategoryIdToHomework < ActiveRecord::Migration[6.0]
  def change
    add_column :homeworks, :category_id, :integer
   end
end
