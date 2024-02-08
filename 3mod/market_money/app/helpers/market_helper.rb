module MarketHelper
  def market_search_params_are_valid?(name, city, state)
    ( city && state.nil? && name.nil? ||
      city && name && state.nil? ) ? false : true
  end
end
