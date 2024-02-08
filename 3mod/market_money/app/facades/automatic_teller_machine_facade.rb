class AutomaticTellerMachineFacade
  attr_reader :market

  def initialize(market)
    @market = market
  end

  def nearest_atms
    atms = service.nearest_atms(@market.lat, @market.lon).map do |atm_data|
      AutomaticTellerMachine.new(atm_data)
    end
    atms.sort_by { |atm| atm.distance }
  end

  private

  def service
    @_service ||= TomTomService.new
  end
end
