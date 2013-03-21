class Item < ActiveRecord::Base
  attr_accessible :kind, :position_x, :position_y, :table_id, :latest_moving_user_name
  belongs_to :table
end
