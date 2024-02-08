require 'rails_helper'

RSpec.describe MarketVendor, type: :model do
  describe 'relationships' do
    it { should belong_to(:market) }
    it { should belong_to(:vendor) }
  end

  describe 'validations' do
    it { should validate_presence_of(:market_id) }
    it { should validate_presence_of(:vendor_id) }
    it { should validate_numericality_of(:market_id) }
    it { should validate_numericality_of(:vendor_id) }
  end

  describe 'instance methods' do
    describe '#is_unique' do
      it 'does not raise an error if the vendor has not already been added to the market' do
        market = create(:market)
        vendor = create(:vendor)

        expect{ MarketVendor.create!(market_id: market.id, vendor_id: vendor.id) }.to_not raise_error
      end

      it 'raises an error if the vendor has already been added to the market' do
        market = create(:market)
        vendor = create(:vendor)
        market_vendor = create(:market_vendor, market: market, vendor: vendor)

        expect{ MarketVendor.create!(market_id: market.id, vendor_id: vendor.id) }.to raise_error(CustomError)
      end
    end
  end
end
