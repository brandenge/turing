require 'rails_helper'

RSpec.describe 'Customers Index Page', type: :feature do
  before(:each) do
    visit customers_path
  end

  it 'has a header' do
    expect(page).to have_content('Customers Index')
  end

  it 'shows all of the customer names as links' do
    Customer.all.each do |customer|
      expect(page).to have_link(customer.name)
    end
  end

  it 'has a link to each customer show page on each customer name' do
    Customer.all.each do |customer|
      click_link customer.name

      expect(current_path).to eq(customer_path(customer))

      visit customers_path
    end
  end
end
