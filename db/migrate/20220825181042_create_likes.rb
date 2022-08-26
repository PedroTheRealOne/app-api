class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, id: false do |t|
      t.belongs_to :user, index: true, foreign_key: true, null: false # user_id
      t.belongs_to :post, index: true, foreign_key: true, null: false # post_id
      t.timestamps
    end
  end
end
