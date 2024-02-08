require 'rails_helper'

RSpec.describe 'Cancel Subscription', type: :request do
  subject!(:subscription) { create(:subscription, status: 'Active') }

  context 'Happy path - valid id' do
    it 'cancels the subscription by updating its status but does not delete it' do
      expect(Subscription.count).to eq(1)
      expect(subscription.status).to eq('Active')
      expect{patch api_v0_subscription_path(subscription)}
        .to change(Subscription, :count).by(0)
      expect(Subscription.count).to eq(1)
      subscription.reload
      expect(subscription.status).to eq('Cancelled')

      expect{ Subscription.find(subscription.id) }
        .to_not raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns the updated subscription' do
      subscription = create(:subscription, status: 'Active')
      patch api_v0_subscription_path(subscription)

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
      expect(subscription[:data][:attributes][:status]).to eq('Cancelled')
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
