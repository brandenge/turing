require 'rails_helper'

RSpec.describe WeatherForecast do
  subject(:weather_forecast) { create(:weather_forecast) }

  describe '#initialize' do
    it 'exists' do
      expect(weather_forecast).to be_a(WeatherForecast)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(weather_forecast).to be_a(WeatherForecast)

      expect(weather_forecast.id).to eq(nil)
      expect(weather_forecast.type).to eq('forecast')

      expect(weather_forecast.current_weather.last_updated)
        .to be_a(String)
      expect(weather_forecast.current_weather.temperature)
        .to be_a(Numeric)
      expect(weather_forecast.current_weather.feels_like)
        .to be_a(Numeric)
      expect(weather_forecast.current_weather.humidity)
        .to be_a(Numeric)
      expect(weather_forecast.current_weather.uvi)
        .to be_a(Numeric)
      expect(weather_forecast.current_weather.visibility)
        .to be_a(Numeric)
      expect(weather_forecast.current_weather.condition)
        .to be_a(String)
      expect(weather_forecast.current_weather.icon)
        .to be_a(String)

      expect(weather_forecast.daily_weather.count).to eq(5)
      expect(weather_forecast.daily_weather.first.date)
        .to be_a(String)
      expect(weather_forecast.daily_weather.first.sunrise)
        .to be_a(String)
      expect(weather_forecast.daily_weather.first.sunset)
        .to be_a(String)
      expect(weather_forecast.daily_weather.first.max_temp)
        .to be_a(Numeric)
      expect(weather_forecast.daily_weather.first.min_temp)
        .to be_a(Numeric)
      expect(weather_forecast.daily_weather.first.condition)
        .to be_a(String)
      expect(weather_forecast.daily_weather.first.icon)
        .to be_a(String)

      expect(weather_forecast.hourly_weather.count)
        .to be_a(Numeric)
      expect(weather_forecast.hourly_weather.first.time)
        .to be_a(String)
      expect(weather_forecast.hourly_weather.first.temperature)
        .to be_a(Numeric)
      expect(weather_forecast.hourly_weather.first.condition)
        .to be_a(String)
      expect(weather_forecast.hourly_weather.first.icon)
        .to be_a(String)
    end
  end
end
