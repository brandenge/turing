require 'rails_helper'

RSpec.describe 'Road Trip', type: :request, vcr: { record: :new_episodes } do
  before do
    post api_v0_users_path({
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    })

    create_user_response = JSON.parse(response.body, symbolize_names: true)
    @api_key = create_user_response[:data][:attributes][:api_key]
  end

  context 'Happy path - valid request' do
    it 'returns a road trip' do
      post api_v0_login_path({
        email: 'whatever@example.com',
        password: 'password'
      })

      post api_v0_road_trip_path({
        origin: 'Cincinatti,OH',
        destination: 'Chicago,IL',
        api_key: @api_key
      })
      expect(response).to be_successful
      expect(response.status).to eq(200)

      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(road_trip).to be_a(Hash)
      expect(road_trip.keys.count).to eq(1)
      expect(road_trip).to have_key(:data)

      data = road_trip[:data]
      expect(data).to be_a(Hash)
      expect(data.keys.count).to eq(3)
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      expect(data[:id]).to eq(nil)
      expect(data[:type]).to be_a(String)
      expect(data[:type]).to eq('road_trip')

      attributes = data[:attributes]
      expect(attributes).to be_a(Hash)
      expect(attributes.keys.count).to eq(4)
      expect(attributes).to have_key(:start_city)
      expect(attributes).to have_key(:end_city)
      expect(attributes).to have_key(:travel_time)
      expect(attributes).to have_key(:weather_at_eta)

      expect(attributes[:start_city]).to be_a(String)
      expect(attributes[:end_city]).to be_a(String)
      expect(attributes[:travel_time]).to be_a(String)
      expect(attributes[:weather_at_eta]).to be_a(Hash)

      weather_at_eta = attributes[:weather_at_eta]
      expect(weather_at_eta.keys.count).to eq(3)
      expect(weather_at_eta).to have_key(:datetime)
      expect(weather_at_eta).to have_key(:temperature)
      expect(weather_at_eta).to have_key(:condition)

      expect(weather_at_eta[:datetime]).to be_a(String)
      expect(weather_at_eta[:temperature]).to be_a(Numeric)
      expect(weather_at_eta[:condition]).to be_a(String)
    end
  end

  context 'Sad path - requests' do
    it 'returns an error message when the api key is missing' do
      post api_v0_login_path({
        email: 'whatever@example.com',
        password: 'password'
      })

      post api_v0_road_trip_path({
        origin: 'Cincinatti,OH',
        destination: 'Chicago,IL'
      })

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      error = JSON.parse(response.body, symbolize_names: true)

      check_valid_error_response(error)

      expect(error[:errors].first[:detail]).to eq('Invalid request. The API key is missing or invalid.')
    end

    it 'returns an error message when the api key is invalid' do
      post api_v0_login_path({
        email: 'whatever@example.com',
        password: 'password'
      })

      post api_v0_road_trip_path({
        origin: 'Cincinatti,OH',
        destination: 'Chicago,IL',
        api_key: 'abc123'
      })

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      error = JSON.parse(response.body, symbolize_names: true)

      check_valid_error_response(error)

      expect(error[:errors].first[:detail]).to eq('Invalid request. The API key is missing or invalid.')
    end

    it 'returns an error message if the user is not logged in' do
      post api_v0_road_trip_path({
        origin: 'Cincinatti,OH',
        destination: 'Chicago,IL',
        api_key: @api_key
      })

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      error = JSON.parse(response.body, symbolize_names: true)

      check_valid_error_response(error)

      expect(error[:errors].first[:detail]).to eq('Invalid request. You must be logged in.')
    end
  end
end
