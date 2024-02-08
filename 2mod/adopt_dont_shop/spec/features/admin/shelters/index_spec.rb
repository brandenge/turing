require 'rails_helper'

RSpec.describe 'admin shelter index page', type: :feature do
  before(:each) do
    visit "/admin/shelters"
  end

  it 'has a header' do
    expect(page).to have_content("Admin - Shelters")
  end

  it 'correctly displays all shelters' do
    expect(page).to have_content("Happy Pets")
    expect(page).to have_content("Cute Animals Club")
    expect(page).to have_content("Ma and Paws")
    expect(@shelter_1.name).to appear_before(@shelter_3.name)
    expect(@shelter_3.name).to appear_before(@shelter_2.name)
  end

  it 'displays the shelters with pending applications first' do
    expect(page).to have_content("Happy Pets")
    expect(page).to have_content("Cute Animals Club")
    expect(page).to have_content("Ma and Paws")

    within "#shelter-#{@shelter_1.id}" do
      expect(page).to have_content("#{@shelter_1.name}")
      expect(page).to_not have_content("#{@shelter_2.name}")
      expect(page).to_not have_content("#{@shelter_3.name}")
    end
  end

  it 'displays the shelters with pending applications first' do
    expect(page).to have_content("Happy Pets")
    expect(page).to have_content("Cute Animals Club")
    expect(page).to have_content("Ma and Paws")
    
    within "#shelter-#{@shelter_1.id}" do
      expect(page).to have_content("#{@shelter_1.name}")
      expect(page).to_not have_content("#{@shelter_2.name}")
      expect(page).to_not have_content("#{@shelter_3.name}")
    end
  end

  it 'displays the shelters a links to their show pages' do
    expect(page).to have_link("Ma and Paws")
    click_link("Ma and Paws")
    expect(current_path).to eq("/admin/shelters/#{@shelter_1.id}")
  end
end
