require 'rails_helper'

RSpec.describe CurrentWeather do
  subject(:current_weather) do
    CurrentWeather.new(CurrentWeatherFixture::ATTRIBUTES)
  end

  describe '#initialize' do
    it 'exists' do
      expect(current_weather).to be_a(CurrentWeather)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(current_weather.last_updated).to eq('2023-04-18 16:30')
      expect(current_weather.temperature).to eq(55)
      expect(current_weather.feels_like).to eq(45)
      expect(current_weather.humidity).to eq(30)
      expect(current_weather.uvi).to eq(2)
      expect(current_weather.visibility).to eq(20)
      expect(current_weather.condition).to eq('Partly Cloudy')
      expect(current_weather.icon).to eq('partly-cloudy.png')
    end
  end
end
