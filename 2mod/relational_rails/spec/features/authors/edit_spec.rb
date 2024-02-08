require 'rails_helper'

RSpec.describe 'Edit Author Page', type: :feature do
  before(:each) do
    visit "/authors/#{@gabor_mate.id}/edit"
  end

  it 'has an "Edit Author" header ' do
    expect(page).to have_content('Edit Author')
  end

  it 'can update the author' do
    fill_in('Name', with: 'New Name')
    fill_in('Birthdate', with: '1934-04-23')
    uncheck('Is alive')
    fill_in('Citation count', with: 435)
    click_button('Update Author')

    expect(current_path).to eq("/authors/#{@gabor_mate.id}")
    expect(page).to have_content('Name: New Name')
    expect(page).to have_content('Birthdate: 1934-04-23')
    expect(page).to have_content('Is Alive: false')
    expect(page).to have_content('Citation Count: 435')
  end
end
