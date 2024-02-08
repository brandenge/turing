require 'rails_helper'

RSpec.describe 'Customer Show Page', type: :feature do
  before(:each) do
    visit customer_path(@customer_1)
  end

  it 'has headers' do
    expect(page).to have_content('Customer Details')
    expect(page).to have_content('Customer Item Details')
    expect(page).to have_content('ID')
    expect(page).to have_content('Name')
    expect(page).to have_content('Price')
    expect(page).to have_content('Supermarket')
  end

  it 'shows the customer name' do
    expect(page).to have_content(@customer_1.name)
  end

  it 'shows all of the item details for every item for the customer' do
    @customer_1.items.each do |item|
      within "#item-#{item.id}" do
        expect(page).to have_content(item.id)
        expect(page).to have_content(item.name)
        expect(page).to have_content("$#{item.price}.00")
        expect(page).to have_content(item.supermarket.name)
      end
    end
  end

  it 'can add an item to the customer' do
    fill_in('Item id', with: @item_3.id)
    click_button 'Add Item'

    expect(current_path).to eq(customer_path(@customer_1))
    expect(page).to have_content(@item_3.id)
    expect(page).to have_content(@item_3.name)
    expect(page).to have_content("$#{@item_3.price}.00")
    expect(page).to have_content(@item_3.supermarket.name)
  end
end
