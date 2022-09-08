class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :likes

  def liked_by?(user)
    likes.where(user_id: user.id).any?
  end
end
