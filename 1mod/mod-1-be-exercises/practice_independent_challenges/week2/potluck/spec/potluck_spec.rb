require './lib/dish'
require './lib/potluck'

RSpec.describe Potluck do
  couscous_salad = Dish.new('Couscous Salad', :appetizer)
  summer_pizza = Dish.new('Summer Pizza', :appetizer)
  roast_pork = Dish.new('Roast Pork', :entre)
  cocktail_meatballs = Dish.new('Cocktail Meatballs', :entre)
  candy_salad = Dish.new('Candy Salad', :dessert)
  bean_dip = Dish.new('Bean Dip', :appetizer)

  before(:each) do
    @potluck = Potluck.new('7-13-18')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@potluck).to be_a(Potluck)
    end
  end

  describe '#date' do
    it 'has a date' do
      expect(@potluck.date).to eq('7-13-18')
    end
  end

  describe '#dishes' do
    it 'starts with no dishes' do
      expect(@potluck.dishes).to eq([])
    end
  end

  describe '#get_all_from_category' do
    before(:each) do
      @potluck.add_dish(couscous_salad)
      @potluck.add_dish(summer_pizza)
      @potluck.add_dish(roast_pork)
      @potluck.add_dish(cocktail_meatballs)
      @potluck.add_dish(candy_salad)
    end

    it 'returns an array of all dishes from the given category' do
      expect(@potluck.get_all_from_category(:appetizer)).to eq([couscous_salad, summer_pizza])
      expect(@potluck.get_all_from_category(:appetizer).first).to eq(couscous_salad)
      expect(@potluck.get_all_from_category(:appetizer).first.name).to eq(couscous_salad.name)
    end

    it 'returns an array of all dishes from a different category' do
      expect(@potluck.get_all_from_category(:entre)).to eq([roast_pork, cocktail_meatballs])
      expect(@potluck.get_all_from_category(:entre).first).to eq(roast_pork)
      expect(@potluck.get_all_from_category(:entre).first.name).to eq(roast_pork.name)
    end
  end

  describe '#menu' do
    before(:each) do
      @potluck.add_dish(couscous_salad)
      @potluck.add_dish(summer_pizza)
      @potluck.add_dish(roast_pork)
      @potluck.add_dish(cocktail_meatballs)
      @potluck.add_dish(candy_salad)
      @potluck.add_dish(bean_dip)
    end

    it 'creates a hash of all dishes sorted by name within their category' do
      expected = {
        appetizers: ['Bean Dip', 'Couscous Salad', 'Summer Pizza'],
        entres: ['Cocktail Meatballs', 'Roast Pork'],
        desserts: ['Candy Salad']
      }
      expect(@potluck.menu).to eq(expected)
    end
  end

  describe '#ratio' do
    before(:each) do
      @potluck.add_dish(couscous_salad)
      @potluck.add_dish(summer_pizza)
      @potluck.add_dish(roast_pork)
      @potluck.add_dish(cocktail_meatballs)
      @potluck.add_dish(candy_salad)
      @potluck.add_dish(bean_dip)
    end

    it 'returns the percentage of dishes by category' do
      expect(@potluck.ratio(:appetizer).to_s).to eq('50.0')
    end

    it 'returns the percentage of dishes for a different category' do
      expect(@potluck.ratio(:entre).to_s).to eq('33.3')
    end
  end
end
