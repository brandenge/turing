require 'rails_helper'

RSpec.describe 'Author Show Page', type: :feature do
  before(:each) do
    visit "/authors/#{@gabor_mate.id}"
  end

  it 'has a link on the author index page that links to the author show page' do
    visit '/authors'

    click_link(@gabor_mate.name)

    expect(current_path).to eq("/authors/#{@gabor_mate.id}")
  end

  it 'shows an "Author Details" header' do
    visit "/authors/#{@gabor_mate.id}"

    expect(page).to have_content("Author Details")
  end

  it 'shows all the author\'s details' do
    visit "/authors/#{@gabor_mate.id}"

    expect(page).to have_content("Name: #{@gabor_mate.name}")
    expect(page).to have_content("Birthdate: #{@gabor_mate.birthdate}")
    expect(page).to have_content("Is Alive: #{@gabor_mate.is_alive}")
    expect(page).to have_content("Citation Count: #{@gabor_mate.citation_count}")
    expect(page).to have_content("ID: #{@gabor_mate.id}")
    expect(page).to have_content("Created At: #{@gabor_mate.created_at}")
    expect(page).to have_content("Updated At: #{@gabor_mate.updated_at}")
  end

  it 'shows all of another author\'s details' do
    visit "/authors/#{@jrr_tolkien.id}"

    expect(page).to have_content("Name: #{@jrr_tolkien.name}")
    expect(page).to have_content("Birthdate: #{@jrr_tolkien.birthdate}")
    expect(page).to have_content("Is Alive: #{@jrr_tolkien.is_alive}")
    expect(page).to have_content("Citation Count: #{@jrr_tolkien.citation_count}")
    expect(page).to have_content("ID: #{@jrr_tolkien.id}")
    expect(page).to have_content("Created At: #{@jrr_tolkien.created_at}")
    expect(page).to have_content("Updated At: #{@jrr_tolkien.updated_at}")
  end

  it 'shows the number of books the author has written' do
    Author.all.each do |author|
      visit "/authors/#{author.id}"

      expect(page).to have_content("Number of Published Books: #{author.books.size}")
    end
  end

  it 'has a link to the author\'s bibliography' do
    visit "/authors/#{@gabor_mate.id}"

    click_link "#{@gabor_mate.name} Bibliography"

    expect(current_path).to eq("/authors/#{@gabor_mate.id}/books")
  end

  it 'has a link to update the author' do
    visit "/authors/#{@gabor_mate.id}"

    click_link 'Update Author'

    expect(current_path).to eq("/authors/#{@gabor_mate.id}/edit")
  end

  it 'has a link to delete the author and all their books' do
    visit "/authors/#{@gabor_mate.id}"

    click_link 'Delete Author'

    expect(current_path).to eq('/authors')
    expect(page).to_not have_content(@gabor_mate.name)
  end
end
