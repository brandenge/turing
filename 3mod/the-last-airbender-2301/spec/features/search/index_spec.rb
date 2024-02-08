require 'rails_helper'

RSpec.describe 'Search Page' do
  before do
    visit "#{search_path}?nation=fire+nation"
  end

  it 'it has headers' do
    expect(page).to have_content('The Four Nations')
    expect(page).to have_content('Search Results for: Fire Nation')
    expect(page).to have_content('Name')
    expect(page).to have_content('Image')
    expect(page).to have_content('Allies')
    expect(page).to have_content('Enemies')
    expect(page).to have_content('Affiliations')
  end

  it 'shows the total number of members in the selected nation' do
    expect(page).to have_content('The total number of people who live in the Fire Nation is: 97')
  end

  it 'shows the details of the first 25 members of the searched nation' do
    within "#character-3" do
      expect(page).to have_content('Afiko')
      expect(page).to have_content('Fire Nation')
      expect(page).to have_content('Aang')
      expect(page).to have_content('Fire Nation')
    end
  end
end
