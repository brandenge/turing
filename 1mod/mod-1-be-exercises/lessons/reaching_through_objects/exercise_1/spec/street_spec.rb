require 'spec_helper'

RSpec.describe Street do
  before(:each) do
    @street_1 = Street.new('Adlington Road')
    @street_2 = Street.new('Warner Street')
    @bldg_1 = Building.new('623', 'Savills Apartment Building')
    @bldg_2 = Building.new('123', 'Zebra Apartments')
    @bldg_3 = Building.new('548', 'Willow Creek Apartments')
    @bldg_4 = Building.new('924', 'Homecrest Apartments')
    @bldg_5 = Building.new('392', 'Stillview Apartments')
  end

  describe '#initialize' do
    it 'initializes correctly' do
      expect(@street_1).to be_a(Street)
    end

    it 'initializes correctly again' do
      expect(@street_2).to be_a(Street)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(@street_1.name).to eq('Adlington Road')
    end

    it 'has a different name' do
      expect(@street_2.name).to eq('Warner Street')
    end
  end

  describe '#buildings' do
    it 'returns an array' do
      expect(@street_1.buildings).to be_a(Array)
      expect(@street_2.buildings).to be_a(Array)
    end

    it 'starts empty' do
      expect(@street_1.buildings.empty?).to be(true)
      expect(@street_2.buildings.empty?).to be(true)
    end

    it 'returns an array of buildings' do
      @street_1.add_building(@bldg_1)
      @street_1.add_building(@bldg_2)
      @street_1.add_building(@bldg_3)
      @street_2.add_building(@bldg_4)
      @street_2.add_building(@bldg_5)
      expect(@street_1.buildings.all? { |bldg| bldg.is_a?(Building)})
        .to be(true)
      expect(@street_2.buildings.all? { |bldg| bldg.is_a?(Building)})
        .to be(true)
    end
  end

  describe '#add_building' do
    it 'adds one building' do
      @street_1.add_building(@bldg_1)
      @street_2.add_building(@bldg_2)
      expect(@street_1.buildings.count).to be(1)
      expect(@street_2.buildings.count).to be(1)
    end

    it 'can add one building multiple times' do
      @street_1.add_building(@bldg_1)
      @street_1.add_building(@bldg_2)
      @street_1.add_building(@bldg_3)
      @street_2.add_building(@bldg_4)
      @street_2.add_building(@bldg_5)
      expect(@street_1.buildings.count).to be(3)
      expect(@street_2.buildings.count).to be(2)
    end

    it 'adds the correct buildings' do
      @street_1.add_building(@bldg_1)
      @street_1.add_building(@bldg_2)
      @street_1.add_building(@bldg_3)
      @street_2.add_building(@bldg_4)
      @street_2.add_building(@bldg_5)
      expect(@street_1.buildings).to eq([@bldg_1, @bldg_3, @bldg_2])
      expect(@street_2.buildings).to eq([@bldg_4, @bldg_5])
    end
  end

  describe '#number_of_available_apartments' do
    before(:each) do
      bathroom = Room.new('bathroom')
      bedroom = Room.new('bedroom')
      kitchen = Room.new('kitchen')
      laundry = Room.new('laundry')
      living = Room.new('living')
      apt_1 = Apartment.new
      apt_2 = Apartment.new
      apt_3 = Apartment.new
      apt_4 = Apartment.new
      apt_5 = Apartment.new
      apt_6 = Apartment.new
      apt_6.rent
      @bldg_1.add_apartment(apt_1)
      @bldg_1.add_apartment(apt_2)
      @bldg_2.add_apartment(apt_3)
      @bldg_2.add_apartment(apt_4)
      @bldg_2.add_apartment(apt_5)
      @bldg_2.add_apartment(apt_6)
      @bldg_3.add_apartment(apt_1)
      @bldg_3.add_apartment(apt_2)
      @bldg_3.add_apartment(apt_3)
      @bldg_3.add_apartment(apt_6)
    end

    it 'returns 0 if there are no buildings on the street' do
      expect(@street_1.number_of_available_apartments).to be(0)
      expect(@street_2.number_of_available_apartments).to be(0)
    end

    it 'returns the number of unrented apartments from 1 building' do
      @street_1.add_building(@bldg_1)
      @street_2.add_building(@bldg_2)
      expect(@street_1.number_of_available_apartments).to be(2)
      expect(@street_2.number_of_available_apartments).to be(3)
    end

    it 'returns the number of unrented apartments from multiple buildings' do
      @street_1.add_building(@bldg_1)
      expect(@street_1.number_of_available_apartments).to be(2)
      @street_1.add_building(@bldg_2)
      expect(@street_1.number_of_available_apartments).to be(5)
      @street_2.add_building(@bldg_3)
      expect(@street_2.number_of_available_apartments).to be(3)
    end
  end
end
