require 'rails_helper'

RSpec.describe 'Market Vendors API', type: :request do
  context 'using a valid market id' do
    it 'responds with a list of vendors for the given market id' do
      market = create(:market_with_vendors, vendor_count: 5)
      expect(market.vendor_count).to eq(5)

      get api_v0_market_with_vendors_path(market)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      market_vendors = JSON.parse(response.body, symbolize_names: true)

      expect(market_vendors).to have_key(:data)
      expect(market_vendors[:data]).to be_an(Array)
      expect(market_vendors[:data].count).to eq(5)

      market_vendors[:data].each do |vendor|
        expect(vendor).to have_key(:id)
        expect(vendor[:id]).to be_a(String)

        expect(vendor).to have_key(:type)
        expect(vendor[:type]).to eq('vendor')

        expect(vendor).to have_key(:attributes)
        expect(vendor[:attributes]).to be_a(Hash)

        expect(vendor[:attributes]).to have_key(:name)
        expect(vendor[:attributes][:name]).to be_a(String)

        expect(vendor[:attributes]).to have_key(:description)
        expect(vendor[:attributes][:description]).to be_a(String)

        expect(vendor[:attributes]).to have_key(:contact_name)
        expect(vendor[:attributes][:contact_name]).to be_a(String)

        expect(vendor[:attributes]).to have_key(:contact_phone)
        expect(vendor[:attributes][:contact_phone]).to be_a(String)

        expect(vendor[:attributes]).to have_key(:credit_accepted)
        expect(vendor[:attributes][:credit_accepted]).to be_in([true, false])
      end
    end
  end

  context 'using an invalid market id' do
    it 'responds with error details' do
      invalid_id = 123123123123
      get api_v0_market_with_vendors_path(invalid_id)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq("Couldn't find Market with 'id'=#{invalid_id}")
    end
  end
end
