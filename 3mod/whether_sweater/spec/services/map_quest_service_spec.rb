require 'rails_helper'

RSpec.describe MapQuestService, vcr: { record: :new_episodes } do
  subject(:map_quest_service) { MapQuestService.new }

  describe 'instance methods' do
    describe '#get_city_lat_lon' do
      context 'Happy path - valid and known location' do
        it "returns the latitude and longitude coordinates of a city" do
          expected = {
            lat: 39.74001,
            lng: -104.99202
          }
          expect(map_quest_service.get_city_lat_lng('denver,co'))
            .to eq(expected)
        end
      end

      context 'Sad path - invalid or unknown location' do
        it 'returns an error message for invalid or unknown location' do
          expect { map_quest_service.get_city_lat_lng('Ggeim,FG') }
            .to raise_error(CustomError)
          begin
            map_quest_service.get_city_lat_lng('Ggeim,FG')
          rescue CustomError => e
            expect(e.message).to eq('No location found. Please provide a known location query parameter.')
            expect(e.status).to eq(400)
          end
        end
      end
    end

    describe '#get_route' do
      context 'possible route' do
        it 'returns route data with a travel time' do
          actual = map_quest_service.get_route('chicago,il', 'denver,co')
          expect(actual).to be_a(Hash)
          expect(actual.keys.count).to eq(3)
          expect(actual).to have_key(:start_city)
          expect(actual).to have_key(:end_city)
          expect(actual).to have_key(:travel_time)

          expect(actual[:start_city]).to be_a(String)
          expect(actual[:end_city]).to be_a(String)
          expect(actual[:travel_time]).to be_a(Numeric)
        end
      end

      context 'impossible route' do
        it 'returns route data with the travel time set to impossible route' do
          actual = map_quest_service.get_route('chicago,il', 'honolulu,hi')
          expect(actual).to be_a(Hash)
          expect(actual.keys.count).to eq(3)
          expect(actual).to have_key(:start_city)
          expect(actual).to have_key(:end_city)
          expect(actual).to have_key(:travel_time)

          expect(actual[:start_city]).to be_a(String)
          expect(actual[:end_city]).to be_a(String)
          expect(actual[:travel_time]).to be_a(String)
          expect(actual[:travel_time]).to eq('impossible route')
        end
      end
    end
  end
end
