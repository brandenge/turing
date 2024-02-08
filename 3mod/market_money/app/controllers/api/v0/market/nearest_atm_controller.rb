class Api::V0::Market::NearestAtmController < ApplicationController
  def index
    market = Market.find(params[:market_id])
    atms = AutomaticTellerMachineFacade.new(market).nearest_atms
    render json: AutomaticTellerMachineSerializer.new(atms)
      .serializable_hash.to_json, status: 200
  end
end
