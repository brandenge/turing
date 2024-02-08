require 'rails_helper'

RSpec.describe WeatherForecast do
  subject(:weather_forecast) do
    WeatherForecast.new(**WeatherForecastFixture::ATTRIBUTES)
  end

  describe '#initialize' do
    it 'exists' do
      expect(weather_forecast).to be_a(WeatherForecast)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(weather_forecast.id).to eq(nil)
      expect(weather_forecast.type).to eq('forecast')

      expect(weather_forecast.current_weather.last_updated).to eq('2023-04-18 16:30')
      expect(weather_forecast.current_weather.temperature).to eq(55)
      expect(weather_forecast.current_weather.feels_like).to eq(45)
      expect(weather_forecast.current_weather.humidity).to eq(30)
      expect(weather_forecast.current_weather.uvi).to eq(2)
      expect(weather_forecast.current_weather.visibility).to eq(20)
      expect(weather_forecast.current_weather.condition).to eq('Partly Cloudy')
      expect(weather_forecast.current_weather.icon).to eq('partly-cloudy.png')

      expect(weather_forecast.daily_weather.count).to eq(5)
      expect(weather_forecast.daily_weather.first.date).to eq('2023-04-19')
      expect(weather_forecast.daily_weather.first.sunrise).to eq('07:15 AM')
      expect(weather_forecast.daily_weather.first.sunset).to eq('08:09 PM')
      expect(weather_forecast.daily_weather.first.max_temp).to eq(67)
      expect(weather_forecast.daily_weather.first.min_temp).to eq(43)
      expect(weather_forecast.daily_weather.first.condition).to eq('Sunny')
      expect(weather_forecast.daily_weather.first.icon).to eq('sunny.png')

      expect(weather_forecast.hourly_weather.count).to eq(24)
      expect(weather_forecast.hourly_weather.first.time).to eq('00:00')
      expect(weather_forecast.hourly_weather.first.temperature).to eq(40)
      expect(weather_forecast.hourly_weather.first.condition).to eq('Partly Cloudy')
      expect(weather_forecast.hourly_weather.first.icon).to eq('partly-cloudy-night.png')
    end
  end
end
