require 'rails_helper'

RSpec.describe 'New Author Page', type: :feature do
  before(:each) do
    visit '/authors/new'
  end

  it 'has a "New Author" header ' do
    expect(page).to have_content('New Author')
  end

  it 'can create a new author' do
    fill_in('Name', with: 'Cal Newport')
    fill_in('Birthdate', with: '1982-06-23')
    check('Is alive')
    fill_in('Citation count', with: '635')
    click_button('Create Author')

    expect(current_path).to eq('/authors')
    expect(page).to have_content('Cal Newport')
  end
end
