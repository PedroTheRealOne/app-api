class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :content, null: false
      t.timestamps
    end

    add_index :posts, :user_id
    add_foreign_key :posts, :users
  end
end
