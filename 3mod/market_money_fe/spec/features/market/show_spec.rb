require 'rails_helper'

RSpec.feature 'Market Show Page', vcr: { record: :new_episodes } do
  before do
    market_id = 322482
    @market = MarketFacade.new.market(market_id)
    visit market_path(market_id)
  end

  it 'has headers' do
    expect(page).to have_content(@market.name)
    expect(page).to have_content(@market.street)
    expect(page).to have_content(@market.city)
    expect(page).to have_content(@market.state)
    expect(page).to have_content(@market.zip)
    expect(page).to have_content('Vendors at our Market:')
  end

  it 'shows all of the vendors for the market' do
    within '#vendors' do
      expect(page).to have_css('.vendor', count: 5)

      @market.vendors.each do |vendor|
        expect(page).to have_link(vendor.name)
      end
    end
  end
end
