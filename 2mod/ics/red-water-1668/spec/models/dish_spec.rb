require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    describe '#chef_name' do
      it 'returns the name of the chef who made the dish' do
        expect(@dish_1.chef_name).to eq(@dish_1.chef.name)
      end
    end

    describe '#total_calories' do
      it 'returns the total calories for the dish' do
        expect(@dish_1.total_calories).to eq(@dish_1.ingredients.sum(:calories))
      end
    end
  end
end
