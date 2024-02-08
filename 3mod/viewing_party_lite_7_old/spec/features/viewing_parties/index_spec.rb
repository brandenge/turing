require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  user = create(:user)

  before(:each) do
    visit user_dashboard_path(user)
  end

  it 'has a header' do
    expect(page).to have_content("#{user.name}'s Dashboard")
    expect(page).to have_button('Discover Movies')
  end
end
