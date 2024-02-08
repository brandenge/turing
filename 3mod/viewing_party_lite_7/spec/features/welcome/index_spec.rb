require 'rails_helper'

RSpec.describe 'Visit Landing Page', type: :feature do
  user1 = create(:user)
  user2 = create(:user)
  user3 = create(:user)

  before do
    visit root_path
  end

  it 'includes title of application' do
    expect(page).to have_content('Viewing Party')
  end

  it 'includes button to create a new user' do
    expect(page).to have_button('Create New User')
    click_button 'Create New User'
    expect(current_path).to eq(new_user_path)
  end

  context 'as a visitor that is not logged in' do
    it "includes a list of existing users' email addresses" do
      expect(page).to_not have_content('Existing Users')
      expect(page).to_not have_content(user1.email)
      expect(page).to_not have_content(user2.email)
      expect(page).to_not have_content(user3.email)
    end
  end

  context 'as a user that is logged in' do
    it "includes a list of existing users' email addresses" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit root_path

      expect(page).to have_content('Existing Users')
      expect(page).to have_content(user1.email)
      expect(page).to have_content(user2.email)
      expect(page).to have_content(user3.email)
    end
  end

  it 'includes a link to go back to the landing page(present on all pages)' do
    expect(page).to have_link('Home')
  end

  it 'has a link to a login form' do
    expect(page).to have_button('Log In')

    click_button 'Log In'

    expect(current_path).to eq(login_form_path)
  end
end
