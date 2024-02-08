require 'rails_helper'

RSpec.describe 'Nearest ATMs to Market API', type: :request, vcr: { record: :new_episodes } do
  context 'happy path with valid market id' do
    it 'it returns a list of atms, ordered by proximity, nearest to farthest' do
      market = create(:market, lat: 35.07904, lon: -106.60068)

      get api_v0_market_nearest_atm_index_path(market), headers: JSON_HEADER

      expect(response).to be_successful
      expect(response.status).to eq(200)

      atms = JSON.parse(response.body, symbolize_names: true)

      expect(atms).to have_key(:data)
      expect(atms[:data]).to be_an(Array)

      atms[:data].each do |atm|
        expect(atm).to have_key(:id)
        expect(atm[:id]).to be(nil)

        expect(atm).to have_key(:type)
        expect(atm[:type]).to eq('atm')

        expect(atm).to have_key(:attributes)
        expect(atm[:attributes]).to be_a(Hash)

        expect(atm[:attributes]).to have_key(:name)
        expect(atm[:attributes][:name]).to be_a(String)

        expect(atm[:attributes]).to have_key(:address)
        expect(atm[:attributes][:address]).to be_a(String)

        expect(atm[:attributes]).to have_key(:lat)
        expect(atm[:attributes][:lat]).to be_a(Float)

        expect(atm[:attributes]).to have_key(:lon)
        expect(atm[:attributes][:lon]).to be_a(Float)

        expect(atm[:attributes]).to have_key(:distance)
        expect(atm[:attributes][:distance]).to be_a(Float)
      end

      expect(atms[:data].sort_by{ |atm| atm[:attributes][:distance] })
        .to eq(atms[:data])
    end
  end

  context 'sad path with invalid market id' do
    it 'responds with error details' do
      invalid_market_id = 123123123123

      get api_v0_market_nearest_atm_index_path(invalid_market_id),
        headers: JSON_HEADER

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq("Couldn't find Market with 'id'=#{invalid_market_id}")
    end
  end
end
