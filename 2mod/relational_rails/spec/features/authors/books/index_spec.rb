require 'rails_helper'

RSpec.describe 'Author Books Page', type: :feature do
  before(:each) do
    visit "/authors/#{@gabor_mate.id}/books"
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

  it 'has a "Books By Author" header ' do
    visit "/authors/#{@gabor_mate.id}/books"

    expect(page).to have_content("Books By #{@gabor_mate.name}")

    visit "/authors/#{@jrr_tolkien.id}/books"

    expect(page).to have_content("Books By #{@jrr_tolkien.name}")
  end

  it 'shows all of the author\'s books' do
    @gabor_mate.books.each do |book|
      visit "/authors/#{@gabor_mate.id}/books"

      expect(page).to have_content("Title: #{book.title}")
      if book.subtitle
        expect(page).to have_content("Subtitle: #{book.subtitle}")
      end
      expect(page).to have_content("Publisher: #{book.publisher}")
      expect(page).to have_content("Publication Date: #{book.publication_date}")
      expect(page).to have_content("Is In Print: #{book.is_in_print}")
      expect(page).to have_content("Page Count: #{book.page_count}")
      expect(page).to have_content("ID: #{book.id}")
      expect(page).to have_content("Created At: #{book.created_at}")
      expect(page).to have_content("Updated At: #{book.updated_at}")
    end
  end

  it 'shows all of another author\'s books' do
    @jrr_tolkien.books.each do |book|
      visit "/authors/#{@jrr_tolkien.id}/books"

      expect(page).to have_content("Title: #{book.title}")
      if book.subtitle
        expect(page).to have_content("Subtitle: #{book.subtitle}")
      end
      expect(page).to have_content("Publisher: #{book.publisher}")
      expect(page).to have_content("Publication Date: #{book.publication_date}")
      expect(page).to have_content("Is In Print: #{book.is_in_print}")
      expect(page).to have_content("Page Count: #{book.page_count}")
      expect(page).to have_content("ID: #{book.id}")
      expect(page).to have_content("Created At: #{book.created_at}")
      expect(page).to have_content("Updated At: #{book.updated_at}")
    end
  end

  it 'has a link to add a new book for the author' do
    visit "/authors/#{@gabor_mate.id}/books"

    click_link('Create Book')

    expect(current_path).to eq("/authors/#{@gabor_mate.id}/books/new")
  end

  it 'has a link that sorts the books by title' do
    visit "/authors/#{@gabor_mate.id}/books"

    expect('Scattered Minds').to appear_before('When the Body Says No')
    expect('When the Body Says No').to appear_before('Hold on to Your Kids')
    expect('Hold on to Your Kids').to appear_before('In the Realm of Hungry Ghosts')
    expect('In the Realm of Hungry Ghosts').to appear_before('The Myth of Normal')

    click_link('Sort Books By Title')

    expect('Hold on to Your Kids').to appear_before('In the Realm of Hungry Ghosts')
    expect('In the Realm of Hungry Ghosts').to appear_before('Scattered Minds')
    expect('Scattered Minds').to appear_before('The Myth of Normal')
    expect('The Myth of Normal').to appear_before('When the Body Says No')
  end

  it 'has a link to edit each book' do
    @gabor_mate.books.each do |book|
      visit "/authors/#{@gabor_mate.id}/books"
      click_link "Edit #{book.title}"

      expect(current_path).to eq("/books/#{book.id}/edit")
    end
  end

  it 'has a button to filter books by their number of pages (books with page counts greater than the number)' do
    visit "/authors/#{@gabor_mate.id}/books"
    fill_in('Page count filter', with: 400)
    click_button('Only return records with more than number of page count')

    expect(page).to_not have_content("Title: #{@book1_1.title}")
    expect(page).to_not have_content("Subtitle: #{@book1_1.subtitle}")
    expect(page).to_not have_content("ID: #{@book1_1.id}")

    expect(page).to_not have_content("Title: #{@book1_2.title}")
    expect(page).to_not have_content("Subtitle: #{@book1_2.subtitle}")
    expect(page).to_not have_content("ID: #{@book1_2.id}")

    expect(page).to_not have_content("Title: #{@book1_3.title}")
    expect(page).to_not have_content("Subtitle: #{@book1_3.subtitle}")
    expect(page).to_not have_content("ID: #{@book1_3.id}")

    expect(page).to have_content("Title: #{@book1_4.title}")
    expect(page).to have_content("Subtitle: #{@book1_4.subtitle}")
    expect(page).to have_content("Publisher: #{@book1_4.publisher}")
    expect(page).to have_content("Publication Date: #{@book1_4.publication_date}")
    expect(page).to have_content("Is In Print: #{@book1_4.is_in_print}")
    expect(page).to have_content("Page Count: #{@book1_4.page_count}")
    expect(page).to have_content("ID: #{@book1_4.id}")
    expect(page).to have_content("Created At: #{@book1_4.created_at}")
    expect(page).to have_content("Updated At: #{@book1_4.updated_at}")

    expect(page).to have_content("Title: #{@book1_5.title}")
    expect(page).to have_content("Subtitle: #{@book1_5.subtitle}")
    expect(page).to have_content("Publisher: #{@book1_5.publisher}")
    expect(page).to have_content("Publication Date: #{@book1_5.publication_date}")
    expect(page).to have_content("Is In Print: #{@book1_5.is_in_print}")
    expect(page).to have_content("Page Count: #{@book1_5.page_count}")
    expect(page).to have_content("ID: #{@book1_5.id}")
    expect(page).to have_content("Created At: #{@book1_5.created_at}")
    expect(page).to have_content("Updated At: #{@book1_5.updated_at}")
  end

  it 'has a delete link next to each book' do
    click_link "Delete #{@book1_1.title}"

    expect(page).to_not have_content(@book1_1.title)
  end

  it 'can search for a book by an exact match of its title' do
    fill_in('Exact Match Title:', with: 'Hold on to Your Kids')
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
    expect(page).to_not have_content(@book1_1.title)
    expect(page).to_not have_content(@book1_3.title)
  end
end
