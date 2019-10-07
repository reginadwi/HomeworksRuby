class AddCreatedByToHomework < ActiveRecord::Migration[6.0]
  def change
    add_column :homeworks, :created_by_id, :integer
  end
end
