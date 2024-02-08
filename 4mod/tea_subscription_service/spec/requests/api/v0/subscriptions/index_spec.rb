require 'rails_helper'

RSpec.describe 'Subscriptions Index', type: :request do
  it 'sends a list of all the subscriptions' do
    create_list(:subscription, 5)

    get api_v0_subscriptions_path, headers: { CONTENT_TYPE: 'application/json' }

    expect(response).to be_successful

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions).to be_a(Hash)
    expect(subscriptions).to have_key(:data)
    expect(subscriptions[:data]).to be_an(Array)
    expect(subscriptions[:data].length).to eq(5)

    subscriptions[:data].each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription).to have_key(:type)
      expect(subscription).to have_key(:attributes)

      expect(subscription[:id]).to be_a(String)
      expect(subscription[:type]).to eq('subscription')

      expect(subscription[:attributes]).to be_a(Hash)

      expect(subscription[:attributes]).to have_key(:customer_id)
      expect(subscription[:attributes]).to have_key(:tea_id)
      expect(subscription[:attributes]).to have_key(:title)
      expect(subscription[:attributes]).to have_key(:price)
      expect(subscription[:attributes]).to have_key(:status)
      expect(subscription[:attributes]).to have_key(:frequency)

      expect(subscription[:attributes][:customer_id]).to be_a(Integer)
      expect(subscription[:attributes][:tea_id]).to be_a(Integer)
      expect(subscription[:attributes][:title]).to be_a(String)
      expect(subscription[:attributes][:price]).to be_a(Integer)
      expect(subscription[:attributes][:status]).to be_in(['Active', 'Cancelled'])
      expect(subscription[:attributes][:frequency]).to be_a(Integer)
      expect(subscription[:attributes][:created_at]).to be_a(String)
      expect(subscription[:attributes][:updated_at]).to be_a(String)

      expect(subscription).to have_key(:relationships)
      expect(subscription[:relationships]).to be_a(Hash)
      expect(subscription[:relationships]).to have_key(:customer)
      expect(subscription[:relationships]).to have_key(:tea)
      expect(subscription[:relationships][:customer]).to be_a(Hash)
      expect(subscription[:relationships][:tea]).to be_a(Hash)
      expect(subscription[:relationships][:customer]).to have_key(:data)
      expect(subscription[:relationships][:customer][:data]).to be_a(Hash)
      expect(subscription[:relationships][:tea]).to have_key(:data)
      expect(subscription[:relationships][:tea][:data]).to be_a(Hash)
      expect(subscription[:relationships][:customer][:data]).to have_key(:id)
      expect(subscription[:relationships][:customer][:data]).to have_key(:type)
      expect(subscription[:relationships][:tea][:data]).to have_key(:id)
      expect(subscription[:relationships][:tea][:data]).to have_key(:type)
      expect(subscription[:relationships][:customer][:data][:id]).to be_a(String)
      expect(subscription[:relationships][:customer][:data][:type]).to be_a(String)
      expect(subscription[:relationships][:tea][:data][:id]).to be_a(String)
      expect(subscription[:relationships][:tea][:data][:type]).to be_a(String)
    end
  end
end
