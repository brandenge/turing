require 'rails_helper'

RSpec.describe 'admin shelter show page', type: :feature do
  before(:each) do
    visit "/admin/shelters/#{@shelter_1.id}"
  end

  it 'has a header' do
    expect(page).to have_content("Admin - Shelters - Show")
  end

  it 'displays the shelter name' do
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to_not have_content(@shelter_2.name)
    expect(page).to_not have_content(@shelter_3.name)
  end

  it 'displays the average age of the shelters pets' do
    expect(page).to have_content("Shetler Statistics")
    expect("Shetler Statistics").to appear_before("Average age of adoptable pets: 8.2")
    expect(page).to have_content("Average age of adoptable pets: 8.2")
  end

  it 'displays the number of adoptable pets at the shelter' do
    expect(page).to have_content("Number of adoptable pets: 5")
    expect("Average age of adoptable pets: 8.2").to appear_before("Number of adoptable pets: 5")
  end

  it 'displays the number of pets that have been adopted from the shelter' do
    expect(page).to have_content("Number of pets adopted from this shelter: 0")
    expect("Number of adoptable pets: 5").to appear_before("Number of pets adopted from this shelter: 0")
  end

  it 'displays the number of pets that have pending applications at the shelter' do
    expect(page).to have_content("Action Required")
    expect(page).to have_content("Dunkin Butterbeans")
    expect(page).to have_content("Cheesebro")
    expect(page).to have_content("Tango Mango")
    expect(page).to have_content("Obi Wan Catnobi")
  end

  it 'displays a link to the application show page' do

    within "#pet-#{@pet_3.id}-app-#{@app_2.id}" do
      expect(page).to have_link("View #{@pet_3.name} Application")
      click_on "View #{@pet_3.name} Application"
      expect(current_path).to eq("/admin/applications/#{@app_2.id}")
    end
  end
end
