require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before do
    visit root_path
  end

  it 'it has headers' do
    expect(page).to have_content('The Four Nations')
    expect(page).to have_content('Search For Members by their Nation')
  end

  it 'has a drop-down menu to select a nation' do
    expect(page).to have_select('nation',
      options: ['Air Nomads', 'Earth Kingdom', 'Fire Nation', 'Water Tribes'])
  end

  it 'can redirect to the search page after clicking the search button' do
    expect(page).to have_button('Search For Members')

    select('Fire Nation', from: 'nation')

    click_button('Search For Members')

    expect(current_path).to eq(search_path)
  end
end
