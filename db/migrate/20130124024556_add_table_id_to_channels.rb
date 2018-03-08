class AddTableIdToChannels < ActiveRecord::Migration[4.2]
  def change
    add_column :channels, :table_id, :integer
  end
end
