require 'rails_helper'

RSpec.describe 'Books Index Page', type: :feature do
  before(:each) do
    visit '/books'
  end

  it 'shows a "Books Index" header' do
    expect(page).to have_content("Books Index")
  end

  it 'shows the book that are in print' do
    expect(page).to have_content('Title: Scattered Minds')
    expect(page).to have_content('Subtitle: How Attention Deficit Disorder Originates and What You Can Do About It')
    expect(page).to have_content('Author: Gabor Mate')

    expect(page).to have_content('Title: The Tipping Point')
    expect(page).to have_content('Subtitle: How Little Things Can Make a Big Difference')
    expect(page).to have_content('Author: Malcolm Gladwell')

    expect(page).to have_content('Title: Permission Marketing')
    expect(page).to have_content('Subtitle: Turning Strangers into Friends, and Friends into Customers')
    expect(page).to have_content('Author: Seth Godin')

    expect(page).to have_content('Title: The Hobbit')
    expect(page).to have_content('Author: J.R.R. Tolkien')
  end

  it 'does not show the books that are not in print' do
    expect(page).to_not have_content('Title: Email Addresses of the Rich & Famous')
    expect(page).to_not have_content('Title: Unleashing the Ideavirus')
    expect(page).to_not have_content('Title: On Fairy-Stories')
  end

  it 'has a link to the book show page' do
    visit '/books'

    click_link("#{@book1_1.title}")

    expect(current_path).to eq("/books/#{@book1_1.id}")
  end

  it 'has a link to edit each book' do
    Book.in_print.each do |book|
      visit '/books'
      click_link "Edit #{book.title}"

      expect(current_path).to eq("/books/#{book.id}/edit")
    end
  end

  it 'has a delete link next to each book' do
    click_link "Delete #{@book1_1.title}"

    expect(page).to_not have_content(@book1_1.title)
  end

  it 'has a link to find a book by an exact match of its title' do
    fill_in('Exact match title', with: 'Hold on to Your Kids')
    click_button 'Search for book title by exact match'

    expect(page).to have_content(@book1_3.title)
    expect(page).to_not have_content(@book1_1.title)
    expect(page).to_not have_content(@book2_1.title)
    expect(page).to_not have_content(@book3_1.title)
    expect(page).to_not have_content(@book4_1.title)
  end

  it 'can search for books by their title' do
    fill_in('Search title', with: 'the')
    click_button 'Search for book titles'

    expect(page).to have_content(@book1_2.title)
    expect(page).to have_content(@book1_4.title)
    expect(page).to have_content(@book1_5.title)
    expect(page).to have_content(@book2_1.title)
    expect(page).to have_content(@book2_4.title)
    expect(page).to have_content(@book2_7.title)
    expect(page).to have_content(@book3_1.title)
    expect(page).to have_content(@book3_3.title)
    expect(page).to have_content(@book3_6.title)
    expect(page).to have_content(@book3_9.title)
    expect(page).to have_content(@book4_2.title)
    expect(page).to have_content(@book4_3.title)
    expect(page).to have_content(@book4_4.title)
    expect(page).to have_content(@book4_5.title)
    expect(page).to have_content(@book4_6.title)

    expect(page).to_not have_content(@book1_1.title)
    expect(page).to_not have_content(@book1_3.title)
    expect(page).to_not have_content(@book2_2.title)
    expect(page).to_not have_content(@book2_3.title)
    expect(page).to_not have_content(@book2_5.title)
    expect(page).to_not have_content(@book2_6.title)
    expect(page).to_not have_content(@book3_2.title)
    expect(page).to_not have_content(@book3_4.title)
    expect(page).to_not have_content(@book3_5.title)
    expect(page).to_not have_content(@book3_7.title)
    expect(page).to_not have_content(@book3_8.title)
    expect(page).to_not have_content(@book4_1.title)
  end
end
