class LikesController < ApplicationController
  before_action :authenticate!

  # GET /likes
  def index
    @likes = Like.all
  end

  # POST /likes
  def create
    @like = current_user.likes.new(like_params)

    if @like.save
      render json: @like, status: :created
    else
      render json: { error: @like.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  # DELETE /likes/:id
  def destroy
    @like = current_user.likes.find_by_id(params[:id])

    if @like && @like.destroy
      head :ok
    else
      render json: { error: "Like not found" }, status: :not_found
    end
  end

  private

  def like_params
    params.permit(:post_id)
  end
end
