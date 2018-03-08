class AddLatestMovingUserNameToItems < ActiveRecord::Migration[4.2]
  def change
    add_column :items, :latest_moving_user_name, :string
  end
end
