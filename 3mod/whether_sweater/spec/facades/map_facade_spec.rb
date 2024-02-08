require 'rails_helper'

RSpec.describe MapFacade, vcr: { record: :new_episodes } do
  subject(:map_facade) { MapFacade.new }

  describe 'instance methods' do
    describe '#get_city_lat_lng' do
      context 'Happy path - valid and found city and state location' do
        it "returns the latitude and longitude coordinates of a city" do
          expected = {
            lat: 38.89037,
            lng: -77.03196
          }
          expect(map_facade.get_city_lat_lng('washington,dc'))
            .to eq(expected)
        end
      end

      context 'Sad paths - invalid request' do
        it 'returns a custom error for an invalid location' do
          expect { map_facade.get_city_lat_lng('Ggeim,FG') }
            .to raise_error(CustomError)
          begin
            map_facade.get_city_lat_lng('Ggeim,FG')
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
          actual = map_facade.get_route('chicago,il', 'denver,co')
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
          actual = map_facade.get_route('chicago,il', 'honolulu,hi')
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
