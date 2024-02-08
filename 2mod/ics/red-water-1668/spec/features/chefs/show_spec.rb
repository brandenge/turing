require 'rails_helper'

RSpec.describe 'Chef Show Page', type: :feature do
  before(:each) do
    visit chef_path(@chef_1)
  end

  it 'has the name of the chef' do
    expect(page).to have_content("Chef: #{@chef_1.name}")
  end

  it 'has a link to the chef ingredients index' do
    expect(page).to have_link('Chef Ingredients')

    click_link 'Chef Ingredients'

    expect(current_path).to eq(chef_ingredients_path(@chef_1))
  end
end
