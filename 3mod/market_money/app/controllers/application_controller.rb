class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid
  rescue_from CustomError, with: :custom_error

  private

  def not_found(error)
    render json: ErrorSerializer.new(error).serialize_json, status: 404
  end

  def invalid(error)
    render json: ErrorSerializer.new(error).serialize_json, status: 400
  end

  def custom_error(error)
    render json: ErrorSerializer.new(error).serialize_json, status: error.status
  end
end
