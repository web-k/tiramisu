class AddUserNameToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :user_name, :string
  end
end
