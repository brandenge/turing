require 'rails_helper'

RSpec.describe 'Welcome Home Page', type: :feature do
  before(:each) do
    visit '/'
  end

  it 'displays a welcome message to the user' do
    expect(page).to have_content('Welcome to Authors and Books!')
  end
end
