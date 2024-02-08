require 'spec_helper'

RSpec.describe Pet do
  before(:each) do
    @samson = Pet.new(PET_1)
    @squeaks = Pet.new(PET_2)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@samson).to be_instance_of(Pet)
      expect(@squeaks).to be_instance_of(Pet)
    end
  end

  describe '#name, #type, #age' do
    it 'has attributes' do
      expect(@samson.name).to eq(PET_1[:name])
      expect(@samson.type).to eq(PET_1[:type])
      expect(@samson.age).to eq(PET_1[:age])
    end

    it 'has different attributes' do
      expect(@squeaks.name).to eq(PET_2[:name])
      expect(@squeaks.type).to eq(PET_2[:type])
      expect(@squeaks.age).to eq(PET_2[:age])
    end
  end

  describe '#fed?' do
    it 'is not fed by default' do
      expect(@samson.fed?).to be(false)
    end

    it 'can be fed' do
      @samson.feed
      expect(@samson.fed?).to be(true)
    end
  end

  describe '#feed' do
    it 'it sets the @fed attribute to true' do
      expect(@samson.fed?).to be(false)
      @samson.feed
      expect(@samson.fed?).to be(true)
    end

    it 'does nothing if the @fed attribute is already true' do
      expect(@samson.fed?).to be(false)
      @samson.feed
      expect(@samson.fed?).to be(true)
      @samson.feed
      expect(@samson.fed?).to be(true)
    end
  end
end
