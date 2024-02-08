require 'rails_helper'

RSpec.describe 'admin application show page', type: :feature do
  before(:each) do
    visit "/admin/applications/#{@app_2.id}"
  end

  it 'has headers' do
    expect(page).to have_content("Admin - Application")
    expect(page).to have_content("Application Pets")
  end

  it 'correctly displays all of the pets submitted with the application' do
    expect(page).to have_content("Dunkin Butterbeans")
    expect(page).to have_content("Cheesebro")
    expect(page).to have_content("Tango Mango")
    expect(page).to have_content("Obi Wan Catnobi")
  end

  it 'can approve a pet' do
    within "#pet-#{@pet_1.id}" do
      expect(page).to have_content("#{@pet_1.name}")
      expect(page).to have_button("Approve Pet")
      expect(page).to have_button("Reject Pet")

      click_button("Approve Pet")

      expect(current_path).to eq("/admin/applications/#{@app_2.id}")
      expect(page).to have_content("Pet Status: Approved")
      expect(page).to_not have_button("Approve Pet")
      expect(page).to_not have_button("Reject Pet")
    end
  end

  it 'can reject a pet' do
    within "#pet-#{@pet_1.id}" do
      expect(page).to have_content("#{@pet_1.name}")
      expect(page).to have_button("Approve Pet")
      expect(page).to have_button("Reject Pet")

      click_button("Reject Pet")

      expect(current_path).to eq("/admin/applications/#{@app_2.id}")
      expect(page).to have_content("Pet Status: Rejected")
      expect(page).to_not have_button("Approve Pet")
      expect(page).to_not have_button("Reject Pet")
    end
  end

  it 'shows the application status updated to "Accepted" after all of the application\'s pets are approved' do
    expect(page).to have_content("Application Status: Pending")

    @app_2.pets.each do |pet|
      within "#pet-#{pet.id}" do
        click_button("Approve Pet")
      end
    end

    expect(current_path).to eq("/admin/applications/#{@app_2.id}")
    expect(page).to have_content("Application Status: Accepted")
  end

  it 'shows the application status updated to "Rejected" after all of the application\'s pets are either approved or rejected, and at least 1 pet is rejected' do
    expect(page).to have_content("Application Status: Pending")
    @app_2.pets.each_with_index do |pet, index|
      within "#pet-#{pet.id}" do
        if index == 2
          click_button("Reject Pet")
        else
          click_button("Approve Pet")
        end
      end
    end
    expect(current_path).to eq("/admin/applications/#{@app_2.id}")
    expect(page).to have_content("Application Status: Rejected")
  end

  context 'the application contains a pet that has already been adopted in another accepted application' do
    before(:each) do
      visit "/admin/applications/#{@app_3.id}"
      @app_3.pets.each_with_index do |pet, index|
        within "#pet-#{pet.id}" do
          click_button("Approve Pet")
        end
      end
      visit "/admin/applications/#{@app_2.id}"
    end

    it 'does not show the approval button for pets that are already adopted from another application that has been accepted' do
      within "#pet-#{@app_2.pets.first.id}" do
        expect(page).to_not have_button("Approve Pet")
      end

      within "#pet-#{@app_2.pets.second.id}" do
        expect(page).to_not have_button("Approve Pet")
      end

      within "#pet-#{@app_2.pets.third.id}" do
        expect(page).to_not have_button("Approve Pet")
      end
    end

    it 'does still show the reject button for that pet' do
      within "#pet-#{@app_2.pets.first.id}" do
        expect(page).to have_button("Reject Pet")
      end

      within "#pet-#{@app_2.pets.second.id}" do
        expect(page).to have_button("Reject Pet")
      end

      within "#pet-#{@app_2.pets.third.id}" do
        expect(page).to have_button("Reject Pet")
      end
    end

    it 'displays a message that the pet has already been approved for adoption' do
      within "#pet-#{@app_2.pets.first.id}" do
        expect(page).to have_content("Pet already adopted")
      end

      within "#pet-#{@app_2.pets.second.id}" do
        expect(page).to have_content("Pet already adopted")
      end

      within "#pet-#{@app_2.pets.third.id}" do
        expect(page).to have_content("Pet already adopted")
      end
    end
  end
end
