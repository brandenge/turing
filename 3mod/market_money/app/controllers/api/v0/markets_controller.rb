class Api::V0::MarketsController < ApplicationController
  include MarketHelper

  def index
    markets = Market.all
    render json: MarketSerializer.new(markets).serializable_hash.to_json
  end

  def show
    market = Market.find(params[:id])
    render json: MarketSerializer.new(market).serializable_hash.to_json
  end

  def search
    if market_search_params_are_valid?(search_params[:name], search_params[:city], search_params[:state])
      search_results = Market.search(search_params[:name], search_params[:city], search_params[:state])
      render json: MarketSerializer.new(search_results).serializable_hash.to_json
    else
      raise CustomError.new('Invalid set of parameters. Please provide a valid set of parameters to perform a search with this endpoint.', 422)
    end
  end

  private

  def search_params
    params.permit(:name, :city, :state)
  end
end
