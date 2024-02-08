require 'rails_helper'

RSpec.describe 'User Movies Show Page', feature: true, vcr: { record: :new_episodes } do
  describe 'Movie Details', vcr: { record: :new_episodes } do
    it "After clicking on a movie title from the Top Rated Movies page," do
      @user1 = create(:user)
      movie = MovieService.new.top_rated_movies.first
      movie_details = MovieService.new.full_movie_details(movie[:id])

      visit user_dashboard_movie_path(@user1, movie[:id])

      expect(page).to have_content('Viewing Party')
      expect(page).to have_link('Home')
      expect(page).to have_link('Discover Movies')
      expect(page).to have_content(movie[:title])
      expect(page).to have_link("Create a Viewing Party for #{movie[:title]}")
      expect(page).to have_content("Rating: #{movie[:rating]}")
      expect(page).to have_content("Runtime: #{movie_details[:runtime]}")
      expect(page).to have_content("Genre(s): #{movie_details[:genres]}")
      expect(page).to have_content("Summary")
      expect(page).to have_content(movie_details[:summary])
      expect(page).to have_content("Cast")
      expect(page).to have_content(movie_details[:cast][0][:name])
      expect(page).to have_content(movie_details[:cast][0][:character])
      expect(movie_details[:cast].count).to eq(10)
      expect(page).to have_content("Reviews")
      expect(page).to have_content(movie_details[:reviews][2][:author])
      # expect(page).to have_content(movie_details[:reviews][2][:content])
    end
  end
end
