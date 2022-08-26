class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.belongs_to :user, index: true, foreign_key: true, null: false # user_id
      t.integer :follower_id, null: false # follower_id
      t.timestamps
    end

    add_index :followers, :follower_id
    add_foreign_key :followers, :users, column: :follower_id
  end
end
