require 'rails_helper'

RSpec.describe Subscription, type: :poro do
  subject(:subscription) do
    @customer = create(:customer)
    @tea = create(:tea)

    attributes = {
      id: 123,
      customer_id: @customer.id,
      tea_id: @tea.id,
      title: 'Subscription for tea',
      price: 500,
      status: 'Active',
      frequency: 10
    }
    create(:subscription, attributes)
  end

  describe '#initialize' do
    it 'exists' do
      expect(subscription).to be_a(Subscription)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(subscription.id).to eq(123)
      expect(subscription.customer_id).to eq(@customer.id)
      expect(subscription.tea_id).to eq(@tea.id)
      expect(subscription.title).to eq('Subscription for tea')
      expect(subscription.price).to eq(500)
      expect(subscription.status).to eq('Active')
      expect(subscription.frequency).to eq(10)
    end
  end
end
