class FollowersController < ApplicationController
  before_action :authenticate!

  # GET /followers
  def index
    @followers = current_user.followers
  end

  # POST /followers
  def create
    @follower = current_user.followings.new(user_id: params[:user_id])

    if @follower.save
      render json: @follower, status: :created
    else
      render json: { error: @follower.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  # DELETE /followers/:id
  def destroy
    @follower = Follower.where(user_id: current_user.id, follower_id: params[:id]).first

    # FOLLOWSHIP ID!!
    # @follower = Follower.find(id = params[:id]) if @follower.nil?

    if @follower && @follower.destroy
      render json: { message: "You are no longer following this user" }, status: :ok
    else
      render json: { error: "Follower not found" }, status: :not_found
    end
  end

  private

  def follower_params
    params.permit(:user_id)
  end
end
