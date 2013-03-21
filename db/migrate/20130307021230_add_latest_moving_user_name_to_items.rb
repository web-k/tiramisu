class AddLatestMovingUserNameToItems < ActiveRecord::Migration
  def change
    add_column :items, :latest_moving_user_name, :string
  end
end
