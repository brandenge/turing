require 'rails_helper'

RSpec.describe 'Create User', type: :request, vcr: { record: :new_episodes } do
  context 'Happy path - valid request' do
    it 'creates a user' do
      post api_v0_users_path({
        email: 'whatever@example.com',
        password: 'password',
        password_confirmation: 'password'
      })

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to be_a(Hash)
      expect(user.keys.count).to eq(1)
      expect(user).to have_key(:data)

      data = user[:data]
      expect(data).to be_a(Hash)
      expect(data.keys.count).to eq(3)
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      expect(data[:id]).to be_a(String)
      expect(data[:type]).to eq('users')

      attributes = data[:attributes]
      expect(attributes).to be_a(Hash)
      expect(attributes.keys.count).to eq(2)
      expect(attributes).to have_key(:email)
      expect(attributes).to have_key(:api_key)

      expect(attributes[:email]).to be_a(String)
      expect(attributes[:email]).to eq('whatever@example.com')
      expect(attributes[:api_key]).to be_a(String)
    end
  end

  context 'Sad paths - invalid requests' do
    it 'returns an error message when a request field is missing' do
      post api_v0_users_path({
        email: 'whatever@example.com',
        password: 'password'
      })

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      check_valid_error_response(error)

      expect(error[:errors].first[:detail]).to eq('Invalid request. Missing one or more request fields.')
    end

    it "returns an error message when the passwords don't match" do
      post api_v0_users_path({
        email: 'whatever@example.com',
        password: 'password',
        password_confirmation: 'password1'
      })

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      error = JSON.parse(response.body, symbolize_names: true)

      check_valid_error_response(error)

      expect(error[:errors].first[:detail]).to eq('Invalid request. The password and password confirmation do not match.')
    end

    it 'returns an error message when the email is already taken' do
      create(:user, email: 'whatever@example.com')

      post api_v0_users_path({
        email: 'whatever@example.com',
        password: 'password',
        password_confirmation: 'password'
      })

      expect(response).to_not be_successful
      expect(response.status).to eq(409)

      error = JSON.parse(response.body, symbolize_names: true)

      check_valid_error_response(error)

      expect(error[:errors].first[:detail]).to eq('Invalid request. Another registered user has already taken that email address')
    end
  end
end
