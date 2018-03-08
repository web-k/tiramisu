class CreateTables < ActiveRecord::Migration[4.2]
  def change
    create_table :tables do |t|
      t.string :name

      t.timestamps
    end
  end
end
