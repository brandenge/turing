require 'rails_helper'

RSpec.describe 'application show page', type: :feature do
  context 'the application\'s status is in progress' do
    before(:each) do
      visit "/applications/#{@app_1.id}"
    end

    it 'has a application header' do
      expect(page).to have_content("Application")
    end

    it 'shows the application information' do
      expect(page).to have_content("Name: #{@app_1.name}")
      expect(page).to have_content("Street Address: #{@app_1.street_address}")
      expect(page).to have_content("City: #{@app_1.city}")
      expect(page).to have_content("State: #{@app_1.state}")
      expect(page).to have_content("Zip Code: #{@app_1.zip_code}")
      expect(page).to have_content("Status: #{@app_1.status}")
    end

    it 'it can search for pets for the application' do
      expect(page).to have_content("Add a Pet to this Application")

      fill_in("Search pets", with: "The")
      click_button("Search Pets")
      expect(current_path).to eq("/applications/#{@app_1.id}")

      expect(page).to have_content("Jabba The Butt")
      expect(page).to have_content("The Other Dude")
      expect(page).to_not have_content("The Great Catsby")
      expect(page).to_not have_content("Tango Mango")
      expect(page).to_not have_content("Cheesebro")
    end

    it 'can add a pet to the application' do
      expect(page).to have_content("Add a Pet to this Application")

      fill_in("Search pets", with: "Cheese")
      click_button("Search Pets")

      expect(current_path).to eq("/applications/#{@app_1.id}")
      expect(page).to have_button("Adopt this Pet")

      click_button("Adopt this Pet")
      expect(current_path).to eq("/applications/#{@app_1.id}")
      expect(page).to have_link("Cheesebro")

      click_on("Cheesebro")
      expect(current_path).to eq("/pets/#{@pet_2.id}")
    end

    context 'there are no pets currently added for adoption to the application' do
      it 'does not show the field for adding a reason for adoption' do
        expect(page).to_not have_content("Add Reason for Adopting and Submit Application")
        expect(page).to_not have_field("Reason for adopting", type: :text)
        expect(page).to_not have_button("Submit Application")
      end
    end

    context 'there pets currently added for adoption to the application' do
      before(:each) do
        fill_in("Search pets", with: "Cheese")
        click_button("Search Pets")
        click_button("Adopt this Pet")
      end

      it 'shows the field for adding a reason for adoption' do
        expect(page).to have_content("Add Reason for Adopting and Submit Application")
        expect(page).to have_field("Reason for adopting", type: :text)
        expect(page).to have_button("Submit Application")
      end

      it 'cannot submit the application without a reason' do
        click_button("Submit Application")

        expect(current_path).to eq("/applications/#{@app_1.id}")
        expect(page).to have_content("Add a Pet to this Application")
        expect(page).to have_content("Status: In Progress")
        expect(page).to have_content("Add Reason for Adopting and Submit Application")
        expect(page).to have_field("Reason for adopting", type: :text)
        expect(page).to have_button("Submit Application")
      end

      it 'can submit the application with a reason' do
        fill_in("Reason for adopting", with: "I love cheese")
        click_button("Submit Application")

        expect(current_path).to eq("/applications/#{@app_1.id}")
        expect(page).to_not have_content("Add a Pet to this Application")
        expect(page).to have_content("Status: Pending")
        expect(page).to_not have_content("Add Reason for Adopting and Submit Application")
        expect(page).to_not have_field("Reason for adopting", type: :text)
        expect(page).to_not have_button("Submit Application")
      end

    end
  end

  context 'the application\'s status is not in progress' do
    before(:each) do
      visit "/applications/#{@app_2.id}"
    end

    it 'does not show the search bar' do
      expect(page).to_not have_content("Search pets")
      expect(page).to_not have_field("Search pets", type: :search)
      expect(page).to_not have_button("Search pets")
    end

    it 'does not show the form for adding a reason and submitting the application' do
      expect(page).to_not have_content("Add Reason for Adopting and Submit Application")
      expect(page).to_not have_content("Reason for adopting")
      expect(page).to_not have_field("Reason for Adopting", type: :text)
      expect(page).to_not have_button("Submit Application")
    end
  end

  context 'the application allows for search functionality' do
    before(:each) do
      visit "/applications/#{@app_1.id}"
    end

    it 'allows for partial search matches' do
      expect(page).to have_content("Add a Pet to this Application")

      fill_in("Search pets", with: "The")
      click_button("Search Pets")
      expect(current_path).to eq("/applications/#{@app_1.id}")

      expect(page).to have_content("Jabba The Butt")
      expect(page).to have_content("The Other Dude")
      expect(page).to_not have_content("The Great Catsby")
      expect(page).to_not have_content("Tango Mango")
      expect(page).to_not have_content("Cheesebro")
    end

    it 'allows for case insensitive search matches' do
      expect(page).to have_content("Add a Pet to this Application")

      fill_in("Search pets", with: "tHe")
      click_button("Search Pets")
      expect(current_path).to eq("/applications/#{@app_1.id}")

      expect(page).to have_content("Jabba The Butt")
      expect(page).to have_content("The Other Dude")
      expect(page).to_not have_content("The Great Catsby")
      expect(page).to_not have_content("Tango Mango")
      expect(page).to_not have_content("Cheesebro")
    end
  end
end
