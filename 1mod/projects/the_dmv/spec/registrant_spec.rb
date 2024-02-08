require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new(REGISTRANT_1[:name], REGISTRANT_1[:age], REGISTRANT_1[:permit])
    @registrant_2 = Registrant.new(REGISTRANT_2[:name], REGISTRANT_2[:age])
    @registrant_3 = Registrant.new(REGISTRANT_3[:name], REGISTRANT_3[:age])
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_a(Registrant)
    end

    it 'can still initialize without a permit argument' do
      expect(@registrant_2).to be_a(Registrant)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(@registrant_1.name).to eq(REGISTRANT_1[:name])
    end

    it 'has a different name' do
      expect(@registrant_2.name).to eq(REGISTRANT_2[:name])
    end

    it 'returns a string' do
      expect(@registrant_1.name).to be_a(String)
      expect(@registrant_2.name).to be_a(String)
    end
  end

  describe '#age' do
    it 'has an age' do
      expect(@registrant_1.age).to eq(REGISTRANT_1[:age])
    end

    it 'has a different age' do
      expect(@registrant_2.age).to eq(REGISTRANT_2[:age])
    end

    it 'returns an integer' do
      expect(@registrant_1.age).to be_a(Integer)
      expect(@registrant_2.age).to be_a(Integer)
    end
  end

  describe '#license_data' do
    it 'is a hash' do
      expect(@registrant_1.license_data).to be_a(Hash)
    end

    it 'has a written key' do
      expect(@registrant_1.license_data.include?(:written)).to eq(true)
      expect(@registrant_2.license_data.include?(:written)).to eq(true)
    end

    it 'has a license key' do
      expect(@registrant_1.license_data.include?(:license)).to eq(true)
      expect(@registrant_2.license_data.include?(:license)).to eq(true)
    end

    it 'has a renewed key' do
      expect(@registrant_1.license_data.include?(:renewed)).to eq(true)
      expect(@registrant_2.license_data.include?(:renewed)).to eq(true)
    end

    it 'sets its default values correctly' do
      expect(@registrant_1.written?).to be(false)
      expect(@registrant_2.written?).to be(false)
      expect(@registrant_1.license?).to be(false)
      expect(@registrant_2.license?).to be(false)
      expect(@registrant_1.renewed?).to be(false)
      expect(@registrant_2.renewed?).to be(false)
    end
  end

  describe '#permit?' do
    it 'has a permit' do
      expect(@registrant_1.permit?).to be(true)
    end

    it 'does not have a permit' do
      expect(@registrant_2.permit?).to be(false)
    end
  end

  describe '#written?' do
    it 'returns the written key in license data' do
      expect(@registrant_1.written?).to be(@registrant_1.license_data[:written])
      @registrant_1.license_data[:written] = true
      expect(@registrant_1.written?).to be(@registrant_1.license_data[:written])
    end
  end

  describe '#license?' do
    it 'returns the license key in license data' do
      expect(@registrant_1.license?).to be(@registrant_1.license_data[:license])
      @registrant_1.license_data[:license] = true
      expect(@registrant_1.license?).to be(@registrant_1.license_data[:license])
    end
  end

  describe '#renewed?' do
    it 'returns the renewed key in license data' do
      expect(@registrant_1.renewed?).to be(@registrant_1.license_data[:renewed])
      @registrant_1.license_data[:renewed] = true
      expect(@registrant_1.renewed?).to be(@registrant_1.license_data[:renewed])
    end
  end

  describe '#earn_permit' do
    it 'changes #permit? from false to true' do
      expect(@registrant_2.permit?).to be(false)
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to be(true)
    end

    it 'does nothing if #permit? is already true' do
      expect(@registrant_1.permit?).to be(true)
      @registrant_1.earn_permit
      expect(@registrant_1.permit?).to be(true)
    end

    it 'does nothing if the registrant\'s age is less than 16 years old' do
      expect(@registrant_3.permit?).to be(false)
      @registrant_3.earn_permit
      expect(@registrant_3.permit?).to be(false)
    end

    it 'returns true' do
      expect(@registrant_1.earn_permit).to be(true)
    end
  end

  describe '#set_license_data' do
    it 'can set the written key in the license data to true' do
      expect(@registrant_1.written?).to be(false)
      expect(@registrant_1.set_license_data(:written, true))
      expect(@registrant_1.written?).to be(true)
    end

    it 'can set the license key in the license data to true' do
      expect(@registrant_1.license?).to be(false)
      expect(@registrant_1.set_license_data(:license, true))
      expect(@registrant_1.license?).to be(true)
    end

    it 'can set the renewed key in the license data to true' do
      expect(@registrant_1.renewed?).to be(false)
      expect(@registrant_1.set_license_data(:renewed, true))
      expect(@registrant_1.renewed?).to be(true)
    end

    it 'returns the value that it assigned' do
      expect(@registrant_1.set_license_data(:written, true)).to be(true)
      expect(@registrant_1.set_license_data(:license, false)).to be(false)
      expect(@registrant_1.set_license_data(:renewed, true)).to be(true)
    end
  end
end
