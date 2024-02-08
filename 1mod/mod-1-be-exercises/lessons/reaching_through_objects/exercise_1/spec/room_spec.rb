require 'spec_helper'

RSpec.describe Room do
  before(:each) do
    @bathroom = Room.new('bathroom')
    @kitchen = Room.new('kitchen')
  end

  describe '#initialize' do
    it 'initializes correctly' do
      expect(@bathroom).to be_a(Room)
    end

    it 'initializes correctly again' do
      expect(@kitchen).to be_a(Room)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(@bathroom.name).to eq('bathroom')
    end

    it 'has a different name' do
      expect(@kitchen.name).to eq('kitchen')
    end
  end
end
