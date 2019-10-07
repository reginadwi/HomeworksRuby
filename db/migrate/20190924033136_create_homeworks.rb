class CreateHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworks do |t|
      t.text :homework_name
      t.string :category
      t.date :deadline
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  end
end
