require 'spec_helper'

RSpec.describe Building do
  before(:each) do
    @bldg_1 = Building.new('623', 'Savills Apartment Building')
    @bldg_2 = Building.new('123', 'Zebra Apartments')
    @apt_1 = Apartment.new
    @apt_2 = Apartment.new
    @apt_3 = Apartment.new
    @apt_4 = Apartment.new
    @apt_5 = Apartment.new
  end

  describe '#initialize' do
    it 'initializes correctly' do
      expect(@bldg_1).to be_a(Building)
    end

    it 'initializes correctly again' do
      expect(@bldg_2).to be_a(Building)
    end
  end

  describe '#building_number' do
    it 'has a building number' do
      expect(@bldg_1.building_number).to eq('623')
    end

    it 'has a different building number' do
      expect(@bldg_2.building_number).to eq('123')
    end
  end

  describe '#building_name' do
    it 'has a building name' do
      expect(@bldg_1.building_name).to eq('Savills Apartment Building')
    end

    it 'has a different building name' do
      expect(@bldg_2.building_name).to eq('Zebra Apartments')
    end
  end

  describe '#list_apartments' do
    it 'returns an array' do
      expect(@bldg_1.list_apartments).to be_a(Array)
      expect(@bldg_2.list_apartments).to be_a(Array)
    end

    it 'starts empty' do
      expect(@bldg_1.list_apartments.empty?).to be(true)
      expect(@bldg_2.list_apartments.empty?).to be(true)
    end

    it 'returns an array of apartments' do
      @bldg_1.add_apartment(@apt_1)
      @bldg_1.add_apartment(@apt_2)
      @bldg_1.add_apartment(@apt_3)
      @bldg_2.add_apartment(@apt_4)
      @bldg_2.add_apartment(@apt_5)
      expect(@bldg_1.list_apartments.all? { |apt| apt.is_a?(Apartment)})
        .to be(true)
      expect(@bldg_2.list_apartments.all? { |apt| apt.is_a?(Apartment)})
        .to be(true)
    end
  end

  describe '#add_apartment' do
    it 'adds one apartment' do
      @bldg_1.add_apartment(@apt_1)
      @bldg_2.add_apartment(@apt_2)
      expect(@bldg_1.list_apartments.count).to be(1)
      expect(@bldg_2.list_apartments.count).to be(1)
    end

    it 'can add one apartment multiple times' do
      @bldg_1.add_apartment(@apt_1)
      @bldg_1.add_apartment(@apt_2)
      @bldg_1.add_apartment(@apt_3)
      @bldg_2.add_apartment(@apt_4)
      @bldg_2.add_apartment(@apt_5)
      expect(@bldg_1.list_apartments.count).to be(3)
      expect(@bldg_2.list_apartments.count).to be(2)
    end

    it 'adds the correct apartments' do
      @bldg_1.add_apartment(@apt_1)
      @bldg_1.add_apartment(@apt_2)
      @bldg_1.add_apartment(@apt_3)
      @bldg_2.add_apartment(@apt_4)
      @bldg_2.add_apartment(@apt_5)
      expect(@bldg_1.list_apartments).to eq([@apt_1, @apt_2, @apt_3])
      expect(@bldg_2.list_apartments).to eq([@apt_4, @apt_5])
    end

    it 'cannot add more than four apartments' do
      @bldg_1.add_apartment(@apt_1)
      @bldg_1.add_apartment(@apt_2)
      @bldg_1.add_apartment(@apt_3)
      @bldg_1.add_apartment(@apt_4)
      @bldg_1.add_apartment(@apt_5)
      expect(@bldg_1.list_apartments.count).to be(4)
      expect(@bldg_1.list_apartments).to eq([@apt_1, @apt_2, @apt_3, @apt_4])
    end
  end
end
