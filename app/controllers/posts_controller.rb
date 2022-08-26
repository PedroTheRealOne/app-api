class PostsController < ApplicationController
  before_action :authenticate!

  # GET /posts
  def index
    @posts = current_user.posts
    render json: @posts
  end

  # GET /posts/:id
  def show
    @post = current_user.posts.find_by_id(params[:id])

    unless @post
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render json: { error: @post.errors.full_messages.first }, status: :unprocessable_entity
    end
  end

  # PATCH /posts/:id
  def update
    @post = current_user.posts.find(params[:id])

    if @post && @post.update(post_params)
      render json: @post
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  # DELETE /posts/:id
  def destroy
    @post = current_user.posts.find(params[:id])

    if @post && @post.destroy
      head :ok
    else
      render json: { error: "Post not found" }, status: :not_found
    end
  end

  private

  def post_params
    params.permit(:content)
  end
end
