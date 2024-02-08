require 'rails_helper'

RSpec.describe WeatherForecastFacade, vcr: { record: :new_episodes } do
  subject(:weather_forecast_facade) { WeatherForecastFacade.new }

  describe 'instance methods' do
    describe '#get_forecast' do
      context 'Happy path - valid coordinates' do
        it 'returns a weather forecast object' do
          coordinates = {
            lat: 39.74001,
            lng: -104.99202
          }
          weather_forecast = weather_forecast_facade.get_forecast(coordinates)
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

      context 'Sad path - invalid or unknown location' do
        it 'raises a custom error' do
          coordinates = {
            lat: '%$#@',
            lng: '%^&$'
          }
          expect { weather_forecast_facade.get_forecast(coordinates) }.to raise_error(CustomError)
          begin
            weather_forecast_facade.get_forecast(coordinates)
          rescue CustomError => e
            expect(e.message).to eq('No matching location found.')
            expect(e.status).to eq(400)
          end
        end
      end
    end
  end
end
