require 'rails_helper'

RSpec.feature 'Markets Index Page', vcr: { record: :new_episodes } do
  before do
    visit markets_path
  end

  it 'has headers' do
    expect(page).to have_content('Markets')

    within '#markets' do
      within('#headers') do
        expect(page).to have_content('Name')
        expect(page).to have_content('City')
        expect(page).to have_content('State')
        expect(page).to have_content('More Info')
      end
    end
  end

  it 'shows all the markets' do
    within '#markets' do
      expect(page).to have_css('.market', count: 846)

      within(first('.market')) do
        within('.name') do
          expect(page).to have_content("14&U Farmers' Market")
        end
        within('.city') do
          expect(page).to have_content('Washington')
        end
        within('.state') do
          expect(page).to have_content('District of Columbia')
        end
        within('.more_info') do
          expect(page).to have_button('More Info')
        end
      end
    end
  end
end
