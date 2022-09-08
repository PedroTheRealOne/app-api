class FeedsController < ApplicationController
  before_action :authenticate!

  # GET /feed
  def index
    # Get all posts from all users that the current user is following
    @posts = Feed.new(current_user).all
  end
end
