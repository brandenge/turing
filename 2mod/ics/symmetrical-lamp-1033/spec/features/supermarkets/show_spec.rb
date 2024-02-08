require 'rails_helper'

RSpec.describe 'Supermarket Show Page', type: :feature do
  before(:each) do
    visit supermarket_path(@supermarket_1)
  end

  it 'has headers' do
    expect(page).to have_content('Supermarket Details')
    expect(page).to have_content('Customers')
  end

  it 'shows all of the customer names that have bought items at that supermarket, with each customer name is a link to the customer\'s show page' do
    @supermarket_1.customers.each do |customer|
      expect(page).to have_link(customer.name)
    end
  end
end
