require 'rails_helper'

RSpec.describe "Welcome Page" do
    it 'has a form to search for activities' do
        visit root_path

        expect(page).to have_content("Activity Finder")
        expect(page).to have_field(:num_participants)
        expect(page).to have_button("Find Activities")
    end

    context 'it finds an activity' do
        it 'can search for activities by the number of participants' do
            fill_in :num_participants, with: 1
            click_button 'Find Activities'

            
        end

        it 'it shows the price for each activity' do

        end
    end

    context 'it does not find an activity' do
        it 'returns back to the welcome page' do

        end

        it 'shows a flash message saying that there are no activity for that number of participants' do

        end
    end
end
