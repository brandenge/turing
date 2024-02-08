class Api::V0::RoadTripController < ApplicationController
  def create
    if current_user
      if current_user.api_key != params[:api_key]
        raise CustomError.new('Invalid request. The API key is missing or invalid.', 401)
      else
        road_trip = RoadTripFacade.new.get_road_trip(params[:origin], params[:destination])

        render json: RoadTripSerializer.new(road_trip).serializable_hash.to_json, status: 200
      end
    else
      raise CustomError.new('Invalid request. You must be logged in.', 401)
    end
  end
end
