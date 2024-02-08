require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many(:customer_items).through(:items) }
    it { should have_many(:customers).through(:customer_items) }
  end
end
