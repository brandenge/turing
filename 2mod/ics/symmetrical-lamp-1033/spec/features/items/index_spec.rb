require 'rails_helper'

RSpec.describe 'Items Index Page', type: :feature do
  before(:each) do
    visit items_path
  end

  it 'has a header' do
    expect(page).to have_content('Items Index')
  end

  it 'shows the items details for each item' do
    Item.all.each do |item|
      expect(page).to have_content("Name: #{item.name}")
      expect(page).to have_content("ID: #{item.id}")
      expect(page).to have_content("Price: $#{item.price}.00")
      expect(page).to have_content("Supermarket: #{item.supermarket.name}")
      expect(page).to have_content("Customer Count: #{item.customer_count}")
    end
  end
end
