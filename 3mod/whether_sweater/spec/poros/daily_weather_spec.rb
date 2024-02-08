require 'rails_helper'

RSpec.describe DailyWeather do
  subject(:daily_weather) do
     DailyWeather.new(DailyWeatherFixture::ATTRIBUTES)
  end

  describe '#initialize' do
    it 'exists' do
      expect(daily_weather).to be_a(DailyWeather)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(daily_weather.date).to eq('2023-04-19')
      expect(daily_weather.sunrise).to eq('07:15 AM')
      expect(daily_weather.sunset).to eq('08:09 PM')
      expect(daily_weather.max_temp).to eq(67)
      expect(daily_weather.min_temp).to eq(43)
      expect(daily_weather.condition).to eq('Sunny')
      expect(daily_weather.icon).to eq('sunny.png')
    end
  end
end
