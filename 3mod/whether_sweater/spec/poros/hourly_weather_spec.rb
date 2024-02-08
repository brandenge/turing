require 'rails_helper'

RSpec.describe HourlyWeather do
  subject(:hourly_weather) do
     HourlyWeather.new(HourlyWeatherFixture::ATTRIBUTES)
  end

  describe '#initialize' do
    it 'exists' do
      expect(hourly_weather).to be_a(HourlyWeather)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(hourly_weather.time).to eq('00:00')
      expect(hourly_weather.temperature).to eq(40)
      expect(hourly_weather.condition).to eq('Partly Cloudy')
      expect(hourly_weather.icon).to eq('partly-cloudy-night.png')
    end
  end
end
