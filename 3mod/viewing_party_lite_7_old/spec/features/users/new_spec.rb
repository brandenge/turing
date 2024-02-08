require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  before do
    visit new_user_path
  end

  describe 'New user page' do
    it "should have a title of 'Viewing Party' with subtitle 'Create a New User'" do
      expect(page).to have_content('Viewing Party')
      expect(page).to have_content('Register a New User')
      expect(page).to have_link('Home')
    end

    it 'should have a form to create a new user' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Email')
      expect(page).to have_button('Create New User')
    end

    it 'should create a new user and redirect to the user dashboard page' do
      fill_in 'Name', with: 'John Doe'
      fill_in 'Email', with: 'johndoe123@hotmail.com'
      click_button 'Create New User'
      expect(current_path).to eq(user_dashboard_path(User.last))
    end
  end

  describe 'sad path test' do
    it 'should not create a new user if email is not unique' do
      create(:user, name: 'Jon Smith', email: 'jonsmith@gmail.com')

      fill_in 'Name', with: 'Jon Smith'
      fill_in 'Email', with: 'jonsmith@gmail.com'
      click_button 'Create New User'

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content('Please fill in all fields, email must be unique')
    end

    it 'should not create a new user if both fields are blank' do
      click_button 'Create New User'

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content('Please fill in all fields, email must be unique')
    end

    it 'should not create a new user if name field is blank' do
      fill_in 'Email', with: 'johndoe@aol.com'
      click_button 'Create New User'

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content('Please fill in all fields, email must be unique')
    end

    it 'should not create a new user if email field is blank' do
      fill_in 'Name', with: 'John Doe'
      click_button 'Create New User'
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content('Please fill in all fields, email must be unique')
    end
  end
end
