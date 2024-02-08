class ApplicationController < ActionController::API
  rescue_from CustomError, with: :custom_error

  private

  def custom_error(error)
    render json: ErrorSerializer.new(error).serialize_json, status: error.status
  end

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
