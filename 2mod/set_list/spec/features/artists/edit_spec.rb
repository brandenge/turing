require 'rails_helper'

RSpec.describe 'the artist edit' do
  it 'links to the edit page' do
    artist = Artist.create!(name: 'Prince')

    visit '/artists'

    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can edit the artist' do
    artist = Artist.create!(name: 'Princ')

    visit "/artists"

    expect(page).to have_content('Princ')

    click_button 'Edit Princ'

    fill_in 'Name', with: 'Prince'
    click_button 'Update Artist'

    expect(current_path).to eq('/artists')
    expect(page).to have_content('Prince')
  end
end
