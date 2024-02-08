require 'rails_helper'

RSpec.feature 'Vendor Show Page', vcr: { record: :new_episodes } do
  before do
    @vendor_id = 55297
    @vendor = VendorFacade.new.vendor(@vendor_id)
    visit vendor_path(@vendor_id)
  end

  it 'has headers' do
    expect(page).to have_content('Contact Info:')
    expect(page).to have_content('Credit Accepted?:')
    expect(page).to have_content('Description:')
  end

  it "shows the vendor's information" do
    expect(page).to have_content(@vendor.name)
    expect(page).to have_content(@vendor.description)
    expect(page).to have_content(@vendor.contact_name)
    expect(page).to have_content(@vendor.contact_phone)
    expect(page).to have_content(@vendor.credit_accepted ? 'YES' : 'NO')
  end

  it 'has a form to search for markets to add the vendor to' do
    expect(page).to have_content('Search for Markets to add this vendor:')

    expect(page).to have_field('name', type: 'text')
    expect(page).to have_field('city', type: 'text')
    expect(page).to have_field('state', type: 'text')
    expect(page).to have_button('Search')
  end

  it 'can search for markets and add the vendor to a market' do
    fill_in 'city', with: 'Alexandria'
    fill_in 'state', with: 'Virginia'

    click_button('Search')

    expect(page).to have_content('2 Search Results for city=Alexandria and state=Virginia:')

    within '#search_results' do
      within(first('.search_result')) do
        expect(page).to have_link("Del Ray Farmers' Market")
        expect(page).to have_button('Add Market')
      end
    end
  end
end
