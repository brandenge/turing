require 'rails_helper'

RSpec.describe RoadTrip do
  subject(:road_trip) { RoadTrip.new(RoadTripFixture::ATTRIBUTES) }

  describe '#initialize' do
    it 'exists' do
      expect(road_trip).to be_a(RoadTrip)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(road_trip.start_city).to eq('Cincinatti, OH')
      expect(road_trip.end_city).to eq('Chicago, IL')
      expect(road_trip.travel_time).to eq('04:40:45')
      expect(road_trip.weather_at_eta).to eq({
        datetime: '2023-04-07 23:00',
        temperature: 44.2,
        condition: 'Cloudy with a chance of meatballs'
      })
    end
  end
end
