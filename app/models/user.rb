class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :user_name, presence: true, uniqueness: true

  has_many :posts
  has_many :likes

  has_many :followships

  has_many :followers, through: :followships
  has_many :followings, through: :followships, source: :user
end
