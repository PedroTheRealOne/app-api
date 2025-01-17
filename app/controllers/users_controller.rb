class UsersController < ApplicationController
  #GET /users
  def index
    @users = User.all
    render json: @users
  end

  #POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors.full_messages.first, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :user_name, :bio, :password, :password_confirmation)
  end
end
