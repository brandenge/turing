class ApplicationController < ActionController::API
  rescue_from CustomError, with: :custom_error

  def welcome

  end

  private

  def custom_error(error)
    render json: ErrorSerializer.new(error).serialize_json, status: error.status
  end
end
