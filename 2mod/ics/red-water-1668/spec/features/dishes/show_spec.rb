require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :feature do
  before(:each) do
    visit dish_path(@dish_1)
  end

  it 'has the dish name' do
    expect(page).to have_content("Dish: #{@dish_1.name}")
  end

  it 'has the description of the dish' do
    expect(page).to have_content("Description: #{@dish_1.description}")
  end

  it 'has the dish chef name' do
    expect(page).to have_content("Chef: #{@dish_1.chef_name}")
  end

  it 'has column headers for the list of ingredients' do
    within "#dish-ingredients" do
      expect(page).to have_content("Ingredient")
      expect(page).to have_content("Calories")
    end
  end

  it 'lists the ingredients information for the dish' do
    @dish_1.ingredients.each do |ingredient|
      within "#dish-ingredient-#{ingredient.id}" do
        expect(page).to have_content(ingredient.name)
        expect(page).to have_content(ingredient.calories)
      end
    end
  end

  it 'lists the total calorie count for the dish' do
    expect(page).to have_content("Total Calories: 600")
  end

  it 'has a form for adding a new ingredient to the dish' do
    expect(find('form')).to have_field('Ingredient id')
    expect(page).to have_button('Add Ingredient to Dish')
  end

  it 'adds the ingredient to the dish' do
    fill_in 'Ingredient id', with: @ingredient_4.id
    click_button 'Add Ingredient to Dish'

    expect(current_path).to eq(dish_path(@dish_1))

    within "#dish-ingredient-#{@ingredient_4.id}" do
      expect(page).to have_content(@ingredient_4.name)
      expect(page).to have_content(@ingredient_4.calories)
    end

    expect(page).to have_content("Total Calories: 650")
  end
end
