require 'rails_helper'

RSpec.describe 'Create Market Vendor API', type: :request do
  context 'successfully create a new market vendor' do
    it 'can add a vendor to a market' do
      market = create(:market)
      vendor = create(:vendor)

      market_vendor_params = {
        market_id: market.id,
        vendor_id: vendor.id
      }

      expect(MarketVendor.count).to eq(0)
      expect{ post api_v0_market_vendors_path(market),
        headers: JSON_HEADER,
        params: JSON.generate(market_vendor: market_vendor_params) }
        .to change(MarketVendor, :count).by(1)
      expect(MarketVendor.count).to eq(1)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      created_market_vendor = MarketVendor.last

      expect(created_market_vendor.market_id).to eq(market.id)
      expect(created_market_vendor.vendor_id).to eq(vendor.id)
    end
  end

  context 'fails to add a market to a vendor' do
    it 'sends an error when the either the market id or the vendor id is invalid' do
      invalid_market_id = 987654321
      vendor = create(:vendor)

      market_vendor_params = {
        market_id: invalid_market_id,
        vendor_id: vendor.id
      }

      expect(MarketVendor.count).to eq(0)
      expect{ post api_v0_market_vendors_path(invalid_market_id),
        headers: JSON_HEADER,
        params: JSON.generate(market_vendor: market_vendor_params) }
        .to change(MarketVendor, :count).by(0)
      expect(MarketVendor.count).to eq(0)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq('Validation failed: Market must exist')
    end

    it 'sends an error when the vendor id is not provided' do
      market = create(:market)

      market_vendor_params = {
        market_id: market.id
      }

      expect(MarketVendor.count).to eq(0)
      expect{ post api_v0_market_vendors_path(market),
        headers: JSON_HEADER,
        params: JSON.generate(market_vendor: market_vendor_params) }
        .to change(MarketVendor, :count).by(0)
      expect(MarketVendor.count).to eq(0)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq("Validation failed: Vendor must exist, Vendor can't be blank, Vendor is not a number")
    end

    it 'sends an error when the market vendor association already exists' do
      market = create(:market)
      vendor = create(:vendor)
      market_vendor = create(:market_vendor, market: market, vendor: vendor)

      market_vendor_params = {
        market_id: market.id,
        vendor_id: vendor.id
      }

      expect(MarketVendor.count).to eq(1)
      expect{ post api_v0_market_vendors_path(market),
        headers: JSON_HEADER,
        params: JSON.generate(market_vendor: market_vendor_params) }
        .to change(MarketVendor, :count).by(0)
      expect(MarketVendor.count).to eq(1)

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq("Validation failed: Market vendor association between market with market_id=#{market.id} and vendor_id=#{vendor.id} already exists")
    end
  end
end
