require 'rails_helper'

RSpec.describe 'Header layout' do
  after(:each) do
    expect(page).to have_content('Relational Rails - Authors and Books')

    click_link('Authors Index')

    expect(current_path).to eq('/authors')
  end

  after(:each) do
    click_link('Books Index')

    expect(current_path).to eq('/books')
  end

  it 'displays from the home page' do
    visit '/'
  end

  it 'displays from the authors index page' do
    visit '/authors'
  end

  it 'displays from the authors new page' do
    visit '/authors/new'
  end

  it 'displays from the individual author page' do
    visit "/authors/#{@gabor_mate.id}"
  end

  it 'displays from the author edit page' do
    visit "/authors/#{@gabor_mate.id}/edit"
  end

  it 'displays from the books index page' do
    visit '/books'
  end

  it 'displays from the individual book page' do
    visit "/books/#{@book1_1.id}"
  end

  it 'displays from the edit book page' do
    visit "/books/#{@book1_1.id}/edit"
  end

  it 'displays from the authors book page' do
    visit "/authors/#{@gabor_mate.id}/books"
  end

  it 'displays from the new book page' do
    visit "/authors/#{@gabor_mate.id}/books/new"
  end
end
