require 'rails_helper'

RSpec.describe MarketHelper, type: :helper do
  describe 'search_params_are_valid?' do
    it 'returns true when the search params are valid' do
      expect(market_search_params_are_valid?(nil, nil, 'state')).to be(true)
      expect(market_search_params_are_valid?(nil, 'city', 'state')).to be(true)
      expect(market_search_params_are_valid?('name', 'city', 'state')).to be(true)
      expect(market_search_params_are_valid?('name', nil, 'state')).to be(true)
      expect(market_search_params_are_valid?('name', nil, nil)).to be(true)
    end

    it 'returns false when the search params are not valid' do
      expect(market_search_params_are_valid?(nil, 'city', nil)).to be(false)
      expect(market_search_params_are_valid?('name', 'city', nil)).to be(false)
    end
  end
end
