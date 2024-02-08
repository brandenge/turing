require 'rails_helper'

RSpec.describe 'Chef Ingredients Index Page', type: :feature do
  before(:each) do
    visit chef_ingredients_path(@chef_1)
  end

  it 'has the name of the chef' do
    expect(page).to have_content("Chef: #{@chef_1.name}")
  end

  it 'has a header' do
    expect(page).to have_content("Chef Ingredients")
  end

  it 'has column headers for the list of ingredients' do
    within "#chef-ingredients" do
      expect(page).to have_content("Ingredient")
      expect(page).to have_content("Calories")
    end
  end

  it 'lists the ingredients information for the dish' do
    @chef_1.ingredients.each do |ingredient|
      within "#chef-ingredient-#{ingredient.id}" do
        expect(page).to have_content(ingredient.name)
        expect(page).to have_content(ingredient.calories)
      end
    end
  end

  it 'has a link back to the chef profile page' do
    expect(page).to have_link('Chef Profile')

    click_link 'Chef Profile'

    expect(current_path).to eq(chef_path(@chef_1))
  end
end
