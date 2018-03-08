class AddUserNameToMessage < ActiveRecord::Migration[4.2]
  def change
    add_column :messages, :user_name, :string
  end
end
