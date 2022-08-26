class FollowersController < ApplicationController
  before_action :authenticate!

  # GET /followers
  def index
    @followers = current_user.followers
    @current_user = current_user
  end

  # POST /followers
  def create
    @follower = Followship.new(user_id: params[:user_id], follower_id: current_user.id)

    if @follower.save
      render json: @follower, status: :created
    else
      render json: { error: @follower.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  # DELETE /followers/:id
  def destroy
    @follower = Followship.find(id = params[:id]) if @follower.nil?

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
