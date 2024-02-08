require 'rails_helper'

RSpec.describe 'Weather Forecast', type: :request, vcr: { record: :new_episodes } do
  context 'Happy path - valid and known location' do
    it 'returns the weather forecast for the given city' do
      get api_v0_forecast_path({ location: 'cincinatti,oh' })

      expect(response).to be_successful
      expect(response.status).to eq(200)

      weather_forecast = JSON.parse(response.body, symbolize_names: true)

      expect(weather_forecast).to be_a(Hash)
      expect(weather_forecast.keys.count).to eq(1)
      expect(weather_forecast).to have_key(:data)

      data = weather_forecast[:data]
      expect(data).to be_a(Hash)
      expect(data.keys.count).to eq(3)
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      expect(data[:id]).to eq(nil)
      expect(data[:type]).to eq('forecast')

      expect(data[:attributes]).to be_a(Hash)
      expect(data[:attributes].keys.count).to eq(3)
      expect(data[:attributes]).to have_key(:current_weather)
      expect(data[:attributes]).to have_key(:daily_weather)
      expect(data[:attributes]).to have_key(:hourly_weather)

      current_weather = data[:attributes][:current_weather]
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

      expect(data[:attributes][:daily_weather]).to be_an(Array)
      expect(data[:attributes][:daily_weather].count).to eq(5)

      data[:attributes][:daily_weather].each do |daily_weather|
        expect(daily_weather).to be_a(Hash)
        expect(daily_weather.keys.count).to eq(7)
        expect(daily_weather).to have_key(:date)
        expect(daily_weather).to have_key(:sunrise)
        expect(daily_weather).to have_key(:sunset)
        expect(daily_weather).to have_key(:max_temp)
        expect(daily_weather).to have_key(:min_temp)
        expect(daily_weather).to have_key(:condition)
        expect(daily_weather).to have_key(:icon)

        expect(daily_weather[:date]).to be_a(String)
        expect(daily_weather[:sunrise]).to be_a(String)
        expect(daily_weather[:sunset]).to be_a(String)
        expect(daily_weather[:max_temp]).to be_a(Numeric)
        expect(daily_weather[:min_temp]).to be_a(Numeric)
        expect(daily_weather[:condition]).to be_a(String)
        expect(daily_weather[:icon]).to be_a(String)
      end

      expect(data[:attributes][:hourly_weather]).to be_an(Array)
      expect(data[:attributes][:hourly_weather].count).to eq(24)

      data[:attributes][:hourly_weather].each do |hourly_weather|
        expect(hourly_weather).to be_a(Hash)
        expect(hourly_weather.keys.count).to eq(4)
        expect(hourly_weather).to have_key(:time)
        expect(hourly_weather).to have_key(:temperature)
        expect(hourly_weather).to have_key(:condition)
        expect(hourly_weather).to have_key(:icon)

        expect(hourly_weather[:time]).to be_a(String)
        expect(hourly_weather[:temperature]).to be_a(Numeric)
        expect(hourly_weather[:condition]).to be_a(String)
        expect(hourly_weather[:icon]).to be_a(String)
      end
    end
  end

  context 'Sad path - invalid or unknown location' do
    it 'returns a response with an error message' do
      get api_v0_forecast_path({ location: 'argea432' })

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      check_valid_error_response(error)

      expect(error[:errors].first[:detail]).to eq('No location found. Please provide a known location query parameter.')
    end
  end
end
