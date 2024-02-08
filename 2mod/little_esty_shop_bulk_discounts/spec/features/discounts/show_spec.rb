require 'rails_helper'

RSpec.describe 'Bulk Discount Show Page', type: :feature do
  before(:each) do
    @merchant_1 = create(:merchant)
    @discount_1 = create(:discount, merchant_id: @merchant_1.id)

    visit merchant_discount_path(@merchant_1, @discount_1)
  end

  it 'has headers' do
    expect(page).to have_content('Bulk Discount Details')
    expect(page).to have_content("Merchant: #{@merchant_1.name}")
  end

  it 'shows the percentage discount and quantity threshold for the discount' do
    expect(page).to have_content("Percentage Discount: #{@discount_1.percentage}%")
    expect(page).to have_content("Quantity Threshold: #{@discount_1.quantity}")
  end

  it 'has a link to edit the discount' do
    expect(page).to have_link("Edit Bulk Discount")

    click_link "Edit Bulk Discount"

    expect(current_path).to eq(edit_merchant_discount_path(@merchant_1, @discount_1))
  end
end
