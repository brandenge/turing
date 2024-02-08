require 'rails_helper'

RSpec.describe AutomaticTellerMachine, type: :poro do
  attributes = {
    id: 123,
    name: 'ATM',
    address: '3902 Central Avenue Southeast, Albuquerque, NM 87108',
    lat: 35.07904,
    lon: -106.60068,
    distance: 0.10521432030421865
  }

  subject(:atm) { create(:automatic_teller_machine, attributes) }

  describe '#initialize' do
    it 'exists' do
      expect(atm).to be_a(AutomaticTellerMachine)
    end
  end

  describe 'attributes' do
    it 'has attributes' do
      expect(atm.id).to eq(123)
      expect(atm.name).to eq('ATM')
      expect(atm.address)
        .to eq('3902 Central Avenue Southeast, Albuquerque, NM 87108')
      expect(atm.lat).to eq(35.07904)
      expect(atm.lon).to eq(-106.60068)
      expect(atm.distance).to eq(0.10521432030421865)
    end
  end
end
