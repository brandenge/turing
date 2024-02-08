require 'rails_helper'

RSpec.describe 'New Book Page', type: :feature do
  before(:each) do
    visit "/authors/#{@gabor_mate.id}/books/new"
  end

  describe 'header tests' do
    it 'has a "Relational Rails - Authors and Books" header' do
      expect(page).to have_content('Relational Rails - Authors and Books')
    end

    it 'has a link to the authors index page' do
      click_link('Authors Index')

      expect(current_path).to eq('/authors')
    end

    it 'has a link to the books index page' do
      click_link('Books Index')

      expect(current_path).to eq('/books')
    end
  end

  it 'has a "New Book" header ' do
    expect(page).to have_content('New Book')
  end

  it 'can create a new book' do
    fill_in('Title', with: 'The Power of Connection')
    fill_in('Subtitle', with: 'Why You Feel Lost and Unhappy')
    fill_in('Publisher', with: 'Portfolio')
    fill_in('Publication date', with: '2023-03-15')
    check('Is in print')
    fill_in('Page count', with: '238')

    click_button('Create Book')

    expect(current_path).to eq("/authors/#{@gabor_mate.id}/books")
    expect(page).to have_content('Title: The Power of Connection')
    expect(page).to have_content('Subtitle: Why You Feel Lost and Unhappy')
    expect(page).to have_content('Publisher: Portfolio')
    expect(page).to have_content('Publication Date: 2023-03-15')
    expect(page).to have_content('Is In Print: true')
    expect(page).to have_content('Page Count: 238')
  end
end
