require 'rails_helper'

RSpec.describe 'Author Index Page', type: :feature do
  before(:each) do
    visit '/authors'
  end

  it 'has an "Authors Index" header ' do
    expect(page).to have_content('Authors Index')
  end

  it 'shows all of the authors' do
    expect(page).to have_content(@gabor_mate.name)
    expect(page).to have_content(@malcolm_gladwell.name)
    expect(page).to have_content(@seth_godin.name)
    expect(page).to have_content(@jrr_tolkien.name)
  end

  it 'shows all of the authors ordered by the time they were created at' do
    expect(@gabor_mate.name).to appear_before(@malcolm_gladwell.name)
    expect(@malcolm_gladwell.name).to appear_before(@seth_godin.name)
    expect(@seth_godin.name).to appear_before(@jrr_tolkien.name)
  end

  it 'has a link to create a new author' do
    click_link 'New Author'

    expect(current_path).to eq('/authors/new')
  end

  it 'has a link to edit each author' do
    visit '/authors'
    click_link "Edit #{@gabor_mate.name}"

    expect(current_path).to eq("/authors/#{@gabor_mate.id}/edit")

    visit '/authors'
    click_link "Edit #{@malcolm_gladwell.name}"

    expect(current_path).to eq("/authors/#{@malcolm_gladwell.id}/edit")

    visit '/authors'
    click_link "Edit #{@seth_godin.name}"

    expect(current_path).to eq("/authors/#{@seth_godin.id}/edit")

    visit '/authors'
    click_link "Edit #{@jrr_tolkien.name}"

    expect(current_path).to eq("/authors/#{@jrr_tolkien.id}/edit")
  end

  it 'has a delete link next to each author' do
    click_link "Delete #{@gabor_mate.name}"

    expect(page).to_not have_content(@gabor_mate.name)
  end

  it 'has a link to sort the authors by their number of books and show their book count' do
    click_link 'Sort by and show book counts'

    expect(@seth_godin.name).to appear_before(@malcolm_gladwell.name)
    expect(@malcolm_gladwell.name).to appear_before(@jrr_tolkien.name)
    expect(@jrr_tolkien.name).to appear_before(@gabor_mate.name)
    expect(page).to have_content('Book Count: 9')
    expect(page).to have_content('Book Count: 7')
    expect(page).to have_content('Book Count: 6')
    expect(page).to have_content('Book Count: 5')
    expect('Book Count: 9').to appear_before('Book Count: 7')
    expect('Book Count: 7').to appear_before('Book Count: 6')
    expect('Book Count: 6').to appear_before('Book Count: 5')
  end

  it 'has a link to search for an author by an exact match of their name' do
    fill_in('Exact match name', with: 'Malcolm Gladwell')
    click_button 'Search for author name by exact match'

    expect(page).to have_content(@malcolm_gladwell.name)
    expect(page).to_not have_content(@gabor_mate.name)
    expect(page).to_not have_content(@seth_godin.name)
    expect(page).to_not have_content(@jrr_tolkien.name)
  end

  it 'can search for authors by their title' do
    fill_in('Search name', with: 'ma')
    click_button 'Search for author names'

    expect(page).to have_content(@gabor_mate.name)
    expect(page).to have_content(@malcolm_gladwell.name)
    expect(page).to_not have_content(@seth_godin.name)
    expect(page).to_not have_content(@jrr_tolkien.name)
  end
end
