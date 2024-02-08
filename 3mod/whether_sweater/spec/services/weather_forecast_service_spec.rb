require 'rails_helper'

RSpec.describe WeatherForecastService, vcr: { record: :new_episodes } do
  subject(:weather_forecast_service) { WeatherForecastService.new }

  describe 'instance methods' do
    describe '#get_forecast' do
      context 'Happy path - valid and known location for forecast' do
        it 'returns weather forecast data' do
          weather_forecast = weather_forecast_service.get_forecast(39.74001, -104.99202)

          expect(weather_forecast).to be_a(Hash)
          expect(weather_forecast.keys.count).to eq(3)
          expect(weather_forecast).to have_key(:current_weather)
          expect(weather_forecast).to have_key(:daily_weather)
          expect(weather_forecast).to have_key(:hourly_weather)

          current_weather = weather_forecast[:current_weather]
          expect(current_weather).to be_a(Hash)
          expect(current_weather.keys.count).to eq(8)
          expect(current_weather).to have_key(:last_updated)
          expect(current_weather).to have_key(:temperature)
          expect(current_weather).to have_key(:feels_like)
          expect(current_weather).to have_key(:humidity)
          expect(current_weather).to have_key(:uvi)
          expect(current_weather).to have_key(:visibility)
          expect(current_weather).to have_key(:condition)
          expect(current_weather).to have_key(:icon)

          expect(current_weather[:last_updated]).to be_a(String)
          expect(current_weather[:temperature]).to be_a(Numeric)
          expect(current_weather[:feels_like]).to be_a(Numeric)
          expect(current_weather[:humidity]).to be_a(Numeric)
          expect(current_weather[:uvi]).to be_a(Numeric)
          expect(current_weather[:visibility]).to be_a(Numeric)
          expect(current_weather[:condition]).to be_a(String)
          expect(current_weather[:icon]).to be_a(String)

          daily_weather = weather_forecast[:daily_weather]
          expect(daily_weather).to be_an(Array)
          expect(daily_weather.count).to eq(5)

          daily_weather.each do |day|
            expect(day).to be_a(Hash)
            expect(day.keys.count).to eq(7)
            expect(day).to have_key(:date)
            expect(day).to have_key(:sunrise)
            expect(day).to have_key(:sunset)
            expect(day).to have_key(:max_temp)
            expect(day).to have_key(:min_temp)
            expect(day).to have_key(:condition)
            expect(day).to have_key(:icon)

            expect(day[:date]).to be_a(String)
            expect(day[:sunrise]).to be_a(String)
            expect(day[:sunset]).to be_a(String)
            expect(day[:max_temp]).to be_a(Numeric)
            expect(day[:min_temp]).to be_a(Numeric)
            expect(day[:condition]).to be_a(String)
            expect(day[:icon]).to be_a(String)
          end

          hourly_weather = weather_forecast[:hourly_weather]
          expect(hourly_weather).to be_an(Array)
          expect(hourly_weather.count).to eq(24)

          hourly_weather.each do |hour|
            expect(hour).to be_a(Hash)
            expect(hour.keys.count).to eq(4)
            expect(hour).to have_key(:time)
            expect(hour).to have_key(:temperature)
            expect(hour).to have_key(:condition)
            expect(hour).to have_key(:icon)

            expect(hour[:time]).to be_a(String)
            expect(hour[:temperature]).to be_a(Numeric)
            expect(hour[:condition]).to be_a(String)
            expect(hour[:icon]).to be_a(String)
          end
        end
      end

      context 'Sad path - invalid or unknown location' do
        it 'raises a custom error' do
          expect { weather_forecast_service.get_forecast('%$#@', '%^&$') }.to raise_error(CustomError)
          begin
            weather_forecast_service.get_forecast('%$#@', '%^&$')
          rescue CustomError => e
            expect(e.message).to eq('No matching location found.')
            expect(e.status).to eq(400)
          end
        end
      end
    end
  end
end
