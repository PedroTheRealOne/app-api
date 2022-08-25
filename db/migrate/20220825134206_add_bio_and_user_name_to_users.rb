class AddBioAndUserNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :string, :default => "", :null => false
    add_column :users, :user_name, :string, :default => "", :null => false
  end
end
