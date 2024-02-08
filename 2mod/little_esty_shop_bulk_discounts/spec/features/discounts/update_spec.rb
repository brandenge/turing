require 'rails_helper'

RSpec.describe 'Bulk Discount Edit Page', type: :feature do
  before(:each) do
    @merchant_1 = create(:merchant)
    @discount_1 = create(:discount, merchant_id: @merchant_1.id, percentage: 10, quantity: 10)

    visit edit_merchant_discount_path(@merchant_1, @discount_1)
  end

  it 'has headers' do
    expect(page).to have_content('Edit Bulk Discount')
  end

  it 'has a link back to the discount show page' do
    expect(page).to have_link("Bulk Discount Details")

    click_link "Bulk Discount Details"

    expect(current_path).to eq(merchant_discount_path(@merchant_1, @discount_1))
  end

  it 'has a form to edit the discount with pre-populated values' do
    expect(page).to have_field("Percentage", with: @discount_1.percentage)
    expect(page).to have_field("Quantity", with: @discount_1.quantity)
  end

  context 'happy path - all fields filled with valid data' do
    it 'can update the discount and redirect back to the discount show page' do
      fill_in "Percentage", with: 20
      fill_in "Quantity", with: 20

      click_button "Update Bulk Discount"

      expect(current_path).to eq(merchant_discount_path(@merchant_1, @discount_1))
      expect(page).to have_content("Percentage Discount: 20%")
      expect(page).to have_content("Quantity Threshold: 20")
    end
  end

  context 'sad path - one or more fields missing' do
    before(:each) do
      fill_in "Percentage", with: 20
      fill_in "Quantity", with: ""

      click_button "Update Bulk Discount"
    end

    it 'redirects back to the edit form if any fields are missing' do
      expect(page).to have_content('Edit Bulk Discount')
    end

    it 'does not edit the bulk discount' do
      expect(@discount_1.percentage).to eq(10)
      expect(@discount_1.quantity).to eq(10)
    end

    it 'displays a flash message indicating which field(s) are missing or invalid' do
      expect(page).to have_content("Error: Quantity can't be blank, Quantity is not a number")
    end
  end

  context 'sad path - the discount has pending invoices' do
    before(:each) do
      customer = create(:customer)
      item = create(:item, merchant: @merchant_1)
      invoice = create(:invoice, customer: customer, status: 'in progress')
      invoice_item = create(:invoice_item, invoice: invoice, item: item, quantity: 10, unit_price: 100)

      fill_in "Percentage", with: 20
      fill_in "Quantity", with: 20

      click_button "Update Bulk Discount"
    end

    it 'does not update the discount' do
      expect(@discount_1.percentage).to eq(10)
      expect(@discount_1.quantity).to eq(10)
    end

    it 're-renders the edit form' do
      expect(page).to have_content('Edit Bulk Discount')
    end

    it 'displays a flash message indicating that the discount cannot be updated' do
      expect(page).to have_content("Error: This discount has pending invoices and therefore cannot be updated.")
    end
  end
end
