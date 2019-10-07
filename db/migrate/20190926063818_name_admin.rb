class NameAdmin < ActiveRecord::Migration[6.0]
  def change
     create_table :nameadmin do |t|
      t.string :nameadmin
      t.timestamps
  end
end
