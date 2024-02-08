require 'rails_helper'

RSpec.describe 'Bulk Discounts Index Page', type: :feature do
  before(:each) do
    @merchant_1 = create(:merchant)
    @discount_1 = create(:discount, merchant_id: @merchant_1.id, quantity: 20, percentage: 20)
    @discount_2 = create(:discount, merchant_id: @merchant_1.id, quantity: 10, percentage: 10)

    url = 'https://date.nager.at/api/v3/NextPublicHolidays/US'
    response = HTTParty.get(url)
    @upcoming_holidays = JSON.parse(response.body, symbolize_names: true).first(3)

    visit merchant_discounts_path(@merchant_1)
  end

  it 'has headers' do
    expect(page).to have_content('Bulk Discounts')
    expect(page).to have_content("Merchant: #{@merchant_1.name}")
  end

  it 'has links' do
    expect(page).to have_link('Add New Bulk Discount')
  end

  it 'displays the percentage discount and quantity threshold for each discount as a link' do
    @merchant_1.discounts.each do |discount|
      within("#discount-#{discount.id}") do
        link_text = "#{discount.percentage}% off #{discount.quantity} items or more"
        expect(page).to have_link(link_text)
        click_link link_text
        expect(current_path).to eq(merchant_discount_path(@merchant_1, discount))
        visit merchant_discounts_path(@merchant_1)
      end
    end
  end

  it 'has buttons to delete each discount' do
    within("#discount-#{@discount_1.id}") do
      expect(page).to have_content("20% off 20 items or more")
      click_button "Delete Bulk Discount"
    end

    expect(current_path).to eq(merchant_discounts_path(@merchant_1.id))
    expect(page).to_not have_content("20% off 20 items or more")
  end

  it 'displays the next 3 upcoming holidays' do
    expect(page).to have_content("Upcoming Holidays")

    @upcoming_holidays.each_with_index do |holiday, index|
      within("#holiday-#{index}")
    end
  end

  context 'sad path - the discount has pending invoices' do
    before(:each) do
      customer = create(:customer)
      item = create(:item, merchant: @merchant_1)
      invoice = create(:invoice, customer: customer, status: 'in progress')
      invoice_item = create(:invoice_item, invoice: invoice, item: item, quantity: 10, unit_price: 100)

      within("#discount-#{@discount_2.id}") do
        click_button "Delete Bulk Discount"
      end
    end

    it 'does not delete the discount' do
      within("#discount-#{@discount_2.id}") do
        expect(page).to have_content("10% off 10 items or more")
        expect(page).to have_button("Delete Bulk Discount")
      end
    end

    it 're-renders the index page' do
      expect(page).to have_content('List of Bulk Discounts')
    end

    it 'displays a flash message indicating that the discount cannot be deleted' do
      expect(page).to have_content("Error: This discount has pending invoices and therefore cannot be deleted.")
    end
  end
end
