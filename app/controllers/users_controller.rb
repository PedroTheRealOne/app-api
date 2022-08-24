class UsersController < ApplicationController
  before_action :authenticate!, only: [:index]

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
    params.permit(:email, :password, :password_confirmation)
  end
end
