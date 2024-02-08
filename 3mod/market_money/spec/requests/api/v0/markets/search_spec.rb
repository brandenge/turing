require 'rails_helper'

RSpec.describe 'Search Markets API', type: :request do
  context 'happy path with valid set of parameters' do
    it 'returns a list of search results' do
      market_attributes = {
        name: "Nob Hill Growers' Market",
        street: 'Lead & Morningside SE',
        city: 'Albuquerque',
        county: 'Bernalillo',
        state: 'New Mexico',
        zip: nil,
        lat: '35.077529',
        lon: '-106.600449',
      }

      market = create(:market_with_vendors, vendor_count: 5, **market_attributes)

      url = '/api/v0/markets/search?city=albuquerque&state=new Mexico&name=Nob hill'

      get url, headers: JSON_HEADER

      expect(response).to be_successful
      expect(response.status).to eq(200)

      markets = JSON.parse(response.body, symbolize_names: true)

      expect(markets).to have_key(:data)

      expect(markets[:data]).to be_an(Array)
      expect(markets[:data].count).to eq(1)

      markets[:data].each do |market|
        expect(market).to have_key(:id)
        expect(market[:id]).to be_a(String)

        expect(market).to have_key(:type)
        expect(market[:type]).to eq('market')

        expect(market).to have_key(:attributes)
        expect(market[:attributes]).to be_a(Hash)

        expect(market[:attributes]).to have_key(:name)
        expect(market[:attributes][:name]).to be_a(String)

        expect(market[:attributes]).to have_key(:street)
        expect(market[:attributes][:street].class).to be_in([String, NilClass])

        expect(market[:attributes]).to have_key(:city)
        expect(market[:attributes][:city].class).to be_in([String, NilClass])

        expect(market[:attributes]).to have_key(:county)
        expect(market[:attributes][:county].class).to be_in([String, NilClass])

        expect(market[:attributes]).to have_key(:state)
        expect(market[:attributes][:state]).to be_a(String)

        expect(market[:attributes]).to have_key(:zip)
        expect(market[:attributes][:zip].class).to be_in([String, NilClass])

        expect(market[:attributes]).to have_key(:lat)
        expect(market[:attributes][:lat].class).to be_in([String, NilClass])

        expect(market[:attributes]).to have_key(:lon)
        expect(market[:attributes][:lon].class).to be_in([String, NilClass])

        expect(market[:attributes]).to have_key(:vendor_count)
        expect(market[:attributes][:vendor_count]).to be_a(Integer)
      end
    end

    it 'returns an empty list if there are no matches for the search' do
      market = create(:market)

      url = '/api/v0/markets/search?city=greag340&state=43tgaeg590&name=3t4agovgs5'

      get url, headers: JSON_HEADER

      expect(response).to be_successful
      expect(response.status).to eq(200)

      markets = JSON.parse(response.body, symbolize_names: true)

      expect(markets).to have_key(:data)
      expect(markets[:data]).to be_an(Array)
      expect(markets[:data].count).to eq(0)
    end
  end

  context 'sad path with invalid set of parameters' do
    it 'sends an error' do
      market_attributes = {
        name: "Nob Hill Growers' Market",
        street: 'Lead & Morningside SE',
        city: 'Albuquerque',
        county: 'Bernalillo',
        state: 'New Mexico',
        zip: nil,
        lat: '35.077529',
        lon: '-106.600449',
      }

      market = create(:market_with_vendors, vendor_count: 5, **market_attributes)

      url = '/api/v0/markets/search?city=albuquerque'

      get url, headers: JSON_HEADER

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to have_key(:errors)
      expect(error_response[:errors]).to be_an(Array)

      expect(error_response[:errors][0]).to have_key(:detail)
      expect(error_response[:errors][0][:detail]).to be_a(String)
      expect(error_response[:errors][0][:detail])
        .to eq('Invalid set of parameters. Please provide a valid set of parameters to perform a search with this endpoint.')
    end
  end
end
