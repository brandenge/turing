require 'rails_helper'

RSpec.describe 'New Bulk Discount Page', type: :feature do
  before(:each) do
    @merchant_1 = create(:merchant)

    visit new_merchant_discount_path(@merchant_1.id)
  end

  it 'has headers' do
    expect(page).to have_content('New Bulk Discount')
    expect(page).to have_content("Merchant: #{@merchant_1.name}")
    expect(page).to have_content("Percentage")
    expect(page).to have_content("Quantity")
  end

  context 'happy path - all fields filled with valid data' do
    it 'can add a new bulk discount' do
      visit merchant_discounts_path(@merchant_1.id)

      expect(page).to_not have_content("10% off 10 items or more")

      click_link "Add New Bulk Discount"

      expect(current_path).to eq(new_merchant_discount_path(@merchant_1.id))

      fill_in "Percentage", with: 10
      fill_in "Quantity", with: 10

      click_button "Create Bulk Discount"

      expect(current_path).to eq(merchant_discounts_path(@merchant_1.id))
      expect(page).to have_content("10% off 10 items or more")
    end
  end

  context 'sad path - one or more fields missing' do
    it 'redirects back to the new bulk discount form' do
      click_button "Create Bulk Discount"

      expect(page).to have_content('New Bulk Discount')
    end

    it 'does not add a new bulk discount' do
      expect(@merchant_1.discounts.length).to eq(0)
      click_button "Create Bulk Discount"
      expect(@merchant_1.discounts.length).to eq(0)
    end

    it 'displays a flash message indicating which field(s) are missing or invalid' do
      click_button "Create Bulk Discount"
      expect(page).to have_content("Error: Percentage can't be blank, Percentage is not a number, Quantity can't be blank, Quantity is not a number")
    end
  end
end
