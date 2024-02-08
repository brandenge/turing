require 'rails_helper'

RSpec.describe 'Application Helpers', type: :helper do
  describe 'instance methods' do
    describe '#format_price' do
      it 'formats the item price' do
        expect(format_price(@item_1)).to eq('$1.00')
        expect(format_price(@item_2)).to eq('$2.00')
        expect(format_price(@item_3)).to eq('$3.00')
        expect(format_price(@item_4)).to eq('$4.00')
        expect(format_price(@item_5)).to eq('$5.00')
      end
    end
  end
end
