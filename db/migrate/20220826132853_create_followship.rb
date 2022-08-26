class CreateFollowship < ActiveRecord::Migration[7.0]
  def change
    create_table :followships do |t|
      t.belongs_to :user, index: true, foreign_key: true, null: false # user_id
      t.integer :follower_id, null: false # follower_id
      t.timestamps
    end

    add_index :followships, :follower_id
    add_foreign_key :followships, :users, column: :follower_id
  end
end
