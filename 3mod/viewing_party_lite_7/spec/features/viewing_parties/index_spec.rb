require 'rails_helper'

RSpec.describe 'User Dashboard', type: :feature do
  user = create(:user)

  context 'a user that is logged in' do
    it 'has a header' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_dashboard_path(user)

      expect(page).to have_content("#{user.name}'s Dashboard")
      expect(page).to have_button('Discover Movies')
    end
  end

  context 'a visitor that is not logged' do
    it 'renders an error page informing the visitor they must be logged in to view their dashboard' do
      visit user_dashboard_path(user)

      expect(page).to have_content('You must be logged in or registered to access your dashboard')
    end
  end
end
