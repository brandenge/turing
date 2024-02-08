require 'rails_helper'

RSpec.describe 'Residents Index Page', type: :feature do
  before(:each) do
    visit "/residents/#{@resident_1.id}"
  end

  it 'shows a "Resident Details" header' do
    expect(page).to have_content('Resident Details')
  end

  it 'shows all of the resident\'s details' do
    expect(page).to have_content("Name: #{@resident_1.name}")
    expect(page).to have_content("Age: #{@resident_1.age}")
    expect(page).to have_content("Occupation: #{@resident_1.occupation}")
  end

  it 'shows all of the resident\'s courses' do
    expect(page).to have_content("#{@resident_1.courses.first.name}")
    expect(page).to have_content("#{@resident_1.courses.last.name}")
  end
end
