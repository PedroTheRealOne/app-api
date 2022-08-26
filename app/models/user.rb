class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, uniqueness: true

  has_many :posts
  has_many :likes
  has_many :followers
  has_many :followings, class_name: "Follower", foreign_key: "follower_id"
end
