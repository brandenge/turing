require 'rails_helper'

RSpec.describe 'New Viewing Party Page', vcr: { record: :new_episodes } do
  describe 'Create a new viewing party' do
    it 'I can create a new viewing party' do
      user1 = create(:user, email: 'jon@jon.com', name: 'Jon')
      user2 = create(:user, email: 'bob@bob.com', name: 'Bob')
      user3 = create(:user, email: 'sally@sally.com', name: 'Sally')
      movie = MovieService.new.top_rated_movies.first
      movie_details = MovieService.new.full_movie_details(movie[:id])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit new_user_dashboard_movie_viewing_party_path(user1, movie[:id])

      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      expect(page).to have_link('Discover Movies')
      expect(page).to have_content('Movie Title')
      expect(page).to have_content(movie[:title])
      expect(page).to have_content('Duration')
      expect(page).to have_content('Date')
      expect(page).to have_field('date')
      expect(page).to have_content('Time')
      expect(page).to have_field('start_time')
      expect(page).to have_field("user_ids[#{user1.id}]")
      expect(page).to have_content('Invite Other Users')
      expect(page).to have_button('Create Party')
      expect(page).to have_content(user1.email)
      expect(page).to have_content(user2.email)
      expect(page).to have_content(user3.email)
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
      expect(page).to have_content(user3.name)
    end

    it 'I can create a new viewing party' do
      user = create(:user, email: 'jon@jon.com', name: 'Jon')
      user2 = create(:user, email: 'bob@bob.com', name: 'Bob')
      movie = MovieService.new.top_rated_movies.first
      movie_details = MovieService.new.full_movie_details(movie[:id])

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_user_dashboard_movie_viewing_party_path(user, movie[:id])

      fill_in :date, with: '2023-08-01'
      fill_in :start_time, with: '12:00'
      fill_in :duration, with: movie_details[:runtime]
      check "user_ids[#{user2.id}]"
      click_on 'Create Party'

      expect(current_path).to eq(user_dashboard_path(user))
    end
  end
end
