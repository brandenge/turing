require 'rails_helper'

RSpec.describe 'Destroy Market Vendor API', type: :request do
  context 'using a valid market id and vendor id combination' do
    it 'can destroy a market vendor' do
      market = create(:market)
      vendor = create(:vendor)
      market_vendor = create(:market_vendor, market: market, vendor: vendor)

      market_vendor_params = {
        market_id: market.id,
        vendor_id: vendor.id
      }

      expect(MarketVendor.count).to eq(1)
      expect{ delete api_v0_market_vendors_path,
        headers: JSON_HEADER,
        params: JSON.generate(market_vendor: market_vendor_params) }
        .to change(MarketVendor, :count).by(-1)
      expect(MarketVendor.count).to eq(0)

      expect(response).to be_successful
      expect(response.status).to eq(204)

      expect{ MarketVendor.find(market_vendor.id) }
      .to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'using an invalid market id and/or invalid vendor id' do
    it 'sends an error when the market vendor association already exists' do
      market = create(:market)
      vendor = create(:vendor)
      market_vendor = create(:market_vendor, market: market, vendor: vendor)
      invalid_vendor_id = 123123123123

      market_vendor_params = {
        market_id: market.id,
        vendor_id: invalid_vendor_id
      }

      expect(MarketVendor.count).to eq(1)
      expect{ delete api_v0_market_vendors_path,
        headers: JSON_HEADER,
        params: JSON.generate(market_vendor: market_vendor_params) }
        .to change(MarketVendor, :count).by(0)
      expect(MarketVendor.count).to eq(1)
      expect{ MarketVendor.find(market_vendor.id) }.to_not raise_error

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq("No MarketVendor with market_id=#{market.id} AND vendor_id=#{invalid_vendor_id} exists")
    end
  end
end
