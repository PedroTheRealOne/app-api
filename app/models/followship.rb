class Followship < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, class_name: "User"

  validates :user_id, uniqueness: { scope: :follower_id, message: "You are already following this user" }
  validate :validate_follow

  private

  def validate_follow
    errors.add(:base, "You can't follow yourself") if user_id == follower_id
  end
end
