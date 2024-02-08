require 'rails_helper'

RSpec.describe 'Edit Book Page', type: :feature do
  before(:each) do
    visit "/books/#{@book1_1.id}/edit"
  end

  it 'has a "Edit Book" header ' do
    expect(page).to have_content('Edit Book')
  end

  it 'can update the book' do
    fill_in('Title', with: 'The Power of Connection')
    fill_in('Subtitle', with: 'Why You Feel Lost and Unhappy')
    fill_in('Publisher', with: 'Portfolio')
    fill_in('Publication date', with: '2023-03-15')
    uncheck('Is in print')
    fill_in('Page count', with: 238)

    click_button('Update Book')

    expect(current_path).to eq("/books/#{@book1_1.id}")
    expect(page).to have_content('Title: The Power of Connection')
    expect(page).to have_content('Subtitle: Why You Feel Lost and Unhappy')
    expect(page).to have_content('Publisher: Portfolio')
    expect(page).to have_content('Publication Date: 2023-03-15')
    expect(page).to have_content('Is In Print: false')
    expect(page).to have_content('Page Count: 238')
  end
end
