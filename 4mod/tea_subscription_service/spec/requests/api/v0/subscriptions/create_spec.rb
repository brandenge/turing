require 'rails_helper'

RSpec.describe 'Create Subscription', type: :request do
  before(:each) do
    expect(Subscription.count).to eq(0)

    @customer = create(:customer)
    @tea = create(:tea)

    post api_v0_subscriptions_path({
      customer_id: @customer.id,
      tea_id: @tea.id,
      title: 'Tea Subscription Title',
      price: 500,
      status: 'Active',
      frequency: 10
    })
  end

  context 'Happy path - valid request' do
    it 'creates a new subscription' do
      subscription = Subscription.last

      expect(Subscription.count).to eq(1)
      expect(subscription.customer_id).to eq(@customer.id)
      expect(subscription.tea_id).to eq(@tea.id)
      expect(subscription.title).to eq('Tea Subscription Title')
      expect(subscription.price).to eq(500)
      expect(subscription.status).to eq('Active')
      expect(subscription.frequency).to eq(10)
    end

    it 'returns the new subscription' do
      expect(response).to be_successful
      expect(response.status).to eq(200)

      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(subscription).to be_a(Hash)
      expect(subscription).to have_key(:data)
      expect(subscription[:data]).to be_a(Hash)
      expect(subscription[:data]).to have_key(:id)
      expect(subscription[:data]).to have_key(:type)
      expect(subscription[:data]).to have_key(:attributes)

      expect(subscription[:data][:id]).to be_a(String)
      expect(subscription[:data][:type]).to eq('subscription')

      expect(subscription[:data][:attributes]).to be_a(Hash)

      expect(subscription[:data][:attributes]).to have_key(:customer_id)
      expect(subscription[:data][:attributes]).to have_key(:tea_id)
      expect(subscription[:data][:attributes]).to have_key(:title)
      expect(subscription[:data][:attributes]).to have_key(:price)
      expect(subscription[:data][:attributes]).to have_key(:status)
      expect(subscription[:data][:attributes]).to have_key(:frequency)

      expect(subscription[:data][:attributes][:customer_id]).to be_a(Integer)
      expect(subscription[:data][:attributes][:tea_id]).to be_a(Integer)
      expect(subscription[:data][:attributes][:title]).to be_a(String)
      expect(subscription[:data][:attributes][:price]).to be_a(Integer)
      expect(subscription[:data][:attributes][:status]).to be_in(['Active', 'Cancelled'])
      expect(subscription[:data][:attributes][:frequency]).to be_a(Integer)
      expect(subscription[:data][:attributes][:created_at]).to be_a(String)
      expect(subscription[:data][:attributes][:updated_at]).to be_a(String)

      expect(subscription[:data]).to have_key(:relationships)
      expect(subscription[:data][:relationships]).to be_a(Hash)
      expect(subscription[:data][:relationships]).to have_key(:customer)
      expect(subscription[:data][:relationships]).to have_key(:tea)
      expect(subscription[:data][:relationships][:customer]).to be_a(Hash)
      expect(subscription[:data][:relationships][:tea]).to be_a(Hash)
      expect(subscription[:data][:relationships][:customer]).to have_key(:data)
      expect(subscription[:data][:relationships][:customer][:data]).to be_a(Hash)
      expect(subscription[:data][:relationships][:tea]).to have_key(:data)
      expect(subscription[:data][:relationships][:tea][:data]).to be_a(Hash)
      expect(subscription[:data][:relationships][:customer][:data]).to have_key(:id)
      expect(subscription[:data][:relationships][:customer][:data]).to have_key(:type)
      expect(subscription[:data][:relationships][:tea][:data]).to have_key(:id)
      expect(subscription[:data][:relationships][:tea][:data]).to have_key(:type)
      expect(subscription[:data][:relationships][:customer][:data][:id]).to be_a(String)
      expect(subscription[:data][:relationships][:customer][:data][:type]).to be_a(String)
      expect(subscription[:data][:relationships][:tea][:data][:id]).to be_a(String)
      expect(subscription[:data][:relationships][:tea][:data][:type]).to be_a(String)
    end
  end
end
