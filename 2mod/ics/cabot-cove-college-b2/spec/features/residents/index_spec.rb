require 'rails_helper'

RSpec.describe 'Residents Index Page', type: :feature do
  before(:each) do
    visit '/residents'
  end

  it 'shows all of the residents' do
    Resident.all.each do |resident|
      expect(page).to have_content("#{resident.name}")
      expect(page).to have_content("Age: #{resident.age}")
      expect(page).to have_content("Occupation: #{resident.occupation}")
    end
  end

  it 'has a link to each resident\'s show page' do
    Resident.all.each do |resident|
      visit '/residents'

      click_link(resident.name)

      expect(current_path).to eq("/residents/#{resident.id}")
    end
  end

  it 'shows the average age of all residents' do
    expect(page).to have_content("Resident Average Age: #{Resident.average_age}")
  end

  it 'orders all of the residents alphabetically by name' do
    expect(@resident_7.name).to appear_before(@resident_3.name)
    expect(@resident_3.name).to appear_before(@resident_6.name)
    expect(@resident_6.name).to appear_before(@resident_5.name)
    expect(@resident_5.name).to appear_before(@resident_2.name)
    expect(@resident_2.name).to appear_before(@resident_1.name)
    expect(@resident_1.name).to appear_before(@resident_4.name)
    expect(@resident_4.name).to appear_before(@resident_8.name)
    expect(@resident_8.name).to appear_before(@resident_10.name)
    expect(@resident_10.name).to appear_before(@resident_9.name)
  end
end
