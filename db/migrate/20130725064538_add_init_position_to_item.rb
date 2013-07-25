class AddInitPositionToItem < ActiveRecord::Migration
  def change
    add_column :items, :init_position_x, :integer
    add_column :items, :init_position_y, :integer
  end
end
