class MarketFacade
  def markets
    service.markets.map do |market_data|
      Market.new(market_data)
    end
  end

  def market(id)
    Market.new(service.market(id))
  end

  def search(name:, city:, state:)
    name = name.empty? ? nil : name
    city = city.empty? ? nil : city
    state = state.empty? ? nil : state
    markets_data = service.markets_search(name: name, city: city, state: state)

    search_params = []
    search_params.push(['name', name]) if name
    search_params.push(['city', city]) if city
    search_params.push(['state', state]) if state

    search_results = {
      search_params: search_params
    }

    if markets_data.is_a?(Array)
      search_results[:markets] = markets_data.map do |market_data|
        Market.new(market_data)
      end
    else
      search_results[:errors] = markets_data[:errors][0][:detail]
    end
    search_results
  end

  private

  def service
    @_service ||= MoneyMarketService.new
  end
end
