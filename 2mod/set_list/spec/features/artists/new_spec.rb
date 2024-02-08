require 'rails_helper'

RSpec.describe 'the Artist creation' do
  it 'links to the new page from the artist index' do
    visit '/artists'

    # click_on # will click on a link or a button
    click_link('New Artist')
    expect(current_path).to eq('/artists/new')
  end

  it 'can create a new artist' do
    visit '/artists/new'

    fill_in('Name', with: 'Prince')
    click_button('Create Artist')

    expect(current_path).to eq('/artists')
    expect(page).to have_content('Prince')
  end
end
