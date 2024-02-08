require 'rspec'
require './lib/registrant'
require './lib/facility'

RSpec.describe Registrant do
  describe '#it exists' do
    it 'exists' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
    
      expect(registrant_1).to be_an_instance_of(Registrant)
      expect(registrant_2).to be_an_instance_of(Registrant)
    end
  end

  describe '#has attributes' do
    it 'has attributes' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      data = {:written=>false, :license=>false, :renewed=>false}

      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_2.name).to eq("Penny")
      expect(registrant_1.age).to eq(18)
      expect(registrant_2.age).to eq(15)
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.permit?).to eq(false)
      expect(registrant_1.license_data).to eq(data)
      expect(registrant_2.license_data).to eq(data)
    end
  end

  describe '#earn_permit' do
    it 'earn_permit' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      data = {:written=>false, :license=>false, :renewed=>false}

      registrant_2.earn_permit

      expect(registrant_2.permit?).to eq(true)
    end
  end

  describe '#passed_written_test' do
    it 'passed_written_test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_1.passed_written_test
      expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
  end

  describe '#passed_road_test' do
    it 'passed_road_test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_1.passed_road_test
      expect(registrant_1.license_data).to eq({:written=>false, :license=>true, :renewed=>false})
    end
  end
end