class Item < ActiveRecord::Base
  attr_accessible :kind, :position_x, :position_y, :table_id
  belongs_to :table
end
