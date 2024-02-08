require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'relationships' do
    it { should belong_to(:shelter) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:breed) }
    it { should validate_exclusion_of(:adoptable).in_array([nil]) }
  end

  # before(:each) do
  #   @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
  #   @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
  #   @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
  #   @pet_3 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)
  # end

  describe 'class methods' do
    describe '::search' do
      it 'returns partial matches' do
        expect(Pet.search("Dunkin")).to eq([@pet_1])
      end
    end

    describe '::adoptable' do
      it 'returns adoptable pets' do
        expect(Pet.adoptable).to eq([@pet_1, @pet_2, @pet_3, @pet_4, @pet_5, @pet_6, @pet_7])
      end
    end

    describe '::search_adoptable_pets' do
      it 'searches for only adoptable pets' do
        expect(Pet.search_adoptable_pets("The")).to eq([@pet_6, @pet_7])
      end
    end
  end

  describe 'instance methods' do
    describe '#shelter_name' do
      it 'returns the shelter name for the given pet' do
        expect(@pet_3.shelter_name).to eq(@shelter_1.name)
      end
    end
  end
end