require 'rails_helper'

RSpec.describe 'Login' do
  describe 'User session' do
    it 'saves the user session' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      expect(page).to have_button('Log Out')
      expect(page).to_not have_button('Log In')
    end

    it 'can log out to end the user session' do
      user = create(:user)

      visit login_form_path

      fill_in :email, with: user.email
      fill_in :password, with: user.password

      click_button 'Log In'

      expect(current_path).to eq(user_dashboard_path(user))
      expect(page).to have_button('Log Out')
      expect(page).to_not have_button('Log In')

      click_button('Log Out')
      expect(current_path).to eq(root_path)
      expect(page).to have_button('Log In')
      expect(page).to_not have_button('Log Out')
    end
  end
end
