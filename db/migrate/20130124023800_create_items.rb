class CreateItems < ActiveRecord::Migration[4.2]
  def change
    create_table :items do |t|
      t.integer :position_x
      t.integer :position_y
      t.string :kind
      t.integer :table_id

      t.timestamps
    end
  end
end
