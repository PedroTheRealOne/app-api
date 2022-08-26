class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :likes

  def get_likes
    Like.where(post_id: id)
  end
end
