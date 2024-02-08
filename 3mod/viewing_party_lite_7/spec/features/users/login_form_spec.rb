require 'rails_helper'

RSpec.describe 'Log In Form', type: :feature do
  before do
    visit login_form_path
  end

  it 'has an email field' do
    expect(page).to have_field('Email')
  end

  it 'has a password field' do
    expect(page).to have_field('Password')
  end

  it 'has a submit button' do
    expect(page).to have_button('Log In')
  end

  it 'can log in a user with valid credentials' do
    user = create(:user)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button 'Log In'

    expect(current_path).to eq(user_dashboard_path(user))
    expect(page).to have_content("Welcome, #{user.name}")
  end

  it 'can not log in with bad credentials' do
    user = create(:user)

    fill_in :email, with: user.email
    fill_in :password, with: 'incorrect password'

    click_button 'Log In'

    expect(current_path).to eq(login_form_path)

    expect(page).to have_content('Sorry, your credentials are bad.')
  end
end
