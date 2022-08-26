class ApplicationController < ActionController::API
  helper_method :current_user

  def current_user
    token = request.headers["Authorization"].to_s.gsub("Bearer ", "")
    @current_user ||= Token.new.decode(token)
  end

  def authenticate!
    render json: { error: "Unauthorized" }, status: :unauthorized unless current_user
  end
end
