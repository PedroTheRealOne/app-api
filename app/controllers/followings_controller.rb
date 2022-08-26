class FollowingsController < ApplicationController
  before_action :authenticate!

  # GET /followings
  def index
    @followings = current_user.followings
  end

  # POST /followings
  def create
  end

  # DELETE /followings/:id
  def destroy
  end
end
