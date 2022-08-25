class Likes < ApplicationController
  before_action :authenticate!

  # GET /likes
  def index
    @likes = current_user.likes
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

  private

  def like_params
    params.permit(:user_id, :post_id)
  end
end
