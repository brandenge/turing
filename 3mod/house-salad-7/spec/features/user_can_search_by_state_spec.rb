require 'rails_helper'

feature 'user can search for house members' do
  scenario 'user submits valid state name' do
    visit '/'

    select 'Colorado', from: :state
    click_on 'Locate Members of the House'
    expect(current_path).to eq(search_path)
    expect(page).to have_content('8 Results')
    expect(page).to have_css('.member', count: 8)

    within(first('.member')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.role')
      expect(page).to have_css('.party')
      expect(page).to have_css('.district')
    end
  end
end
