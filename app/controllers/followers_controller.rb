class FollowersController < ApplicationController
  before_action :authenticate!

  # GET /followers
  def index
    # @followers = current_user.followers

    @followers = Follower.where(follower_id: current_user.id)
    render json: @followers
  end

  # POST /followers
  def create
    if current_user.id != params[:user_id].to_i
      @follower = Follower.first_or_create(user_id: current_user.id, follower_id: params[:user_id])

      if @follower.save
        render json: @follower, status: :created
      else
        render json: { error: @follower.errors.full_messages.first }, status: :unprocessable_entity
      end
    else
      render json: { error: "You can't follow yourself" }, status: :unprocessable_entity
    end
  end

  # DELETE /followers/:id
  def destroy
    @follower = Follower.where(user_id: current_user.id, follower_id: params[:id]).first

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
