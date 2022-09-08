class Feed
  def initialize(user)
    @user = user
  end

  # Feed.new(user).all
  def all
    ids = [user.id, *user.followings.pluck(:id)]
    Post.where(user_id: ids).order(created_at: :desc)
  end

  # Feed.new(user).retweets

  private

  attr_reader :user
end
