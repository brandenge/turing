require 'rails_helper'

RSpec.describe TomTomService, type: :service, vcr: { record: :new_episodes } do
  subject(:tom_tom_service) { TomTomService.new }
  let(:market) { create(:market, lat: 35.07904, lon: -106.60068) }

  describe 'Class constants' do
    it 'has an API domain' do
      expect(TomTomService::API_DOMAIN).to eq('https://api.tomtom.com')
    end

    it 'has a base URL' do
      expect(TomTomService::BASE_URL).to eq("https://api.tomtom.com/search/2/nearbySearch/.json?key=#{ENV['TOM_TOM_API_KEY']}&categorySet=7397")
    end
  end

  describe 'instance methods' do
    describe '#nearest_atms' do
      it 'returns a list of nearby atms from the market' do
        atms = tom_tom_service.nearest_atms(market.lat, market.lon)

        expect(atms).to be_a(Array)

        atms.each do |atm|
          expect(atm).to be_a(Hash)

          expect(atm).to have_key(:id)
          expect(atm[:id]).to be_a(String)

          expect(atm).to have_key(:name)
          expect(atm[:name]).to be_a(String)

          expect(atm).to have_key(:address)
          expect(atm[:address]).to be_a(String)

          expect(atm).to have_key(:lat)
          expect(atm[:lat]).to be_a(Float)

          expect(atm).to have_key(:lon)
          expect(atm[:lon]).to be_a(Float)

          expect(atm).to have_key(:distance)
          expect(atm[:distance]).to be_a(Float)
        end
      end
    end
  end
end
