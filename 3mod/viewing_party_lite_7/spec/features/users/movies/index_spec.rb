require 'rails_helper'

RSpec.describe 'User Movies Index Page', type: :feature do
  before do
    @user = create(:user)
  end

  describe 'Top Rated Movies', :vcr do
    it "After clicking on Top Rated Movies button from Discover Page,
        I should see headers and links" do
      visit user_dashboard_discover_index_path(@user)
      movie = MovieService.new.top_rated_movies.first
      click_link 'Top Rated Movies'

      expect(current_path).to eq(user_dashboard_movies_path(@user))

      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      expect(page).to have_link('Discover Movies')
      expect(page).to have_content('Top Rated Movies')
      expect(page).to have_content('Title')
      expect(page).to have_content('Rating')
      click_on "The Godfather"
      expect(current_path).to eq(user_dashboard_movie_path(@user, movie[:id]))
    end
  end

  describe 'Search Movies', :vcr do
    it 'After entering a search term and clicking on Find Movies button' do
      visit user_dashboard_discover_index_path(@user)
      fill_in :q, with: 'The Matrix'
      click_on 'Find Movies'

      expect(current_path).to eq(user_dashboard_movies_path(@user))
      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      expect(page).to have_link('Discover Movies')
      expect(page).to have_content('The Matrix')
      expect(page).to have_content('Rating')
      expect(page).to have_content('Title')
      click_on "The Matrix"
    end
  end
end
