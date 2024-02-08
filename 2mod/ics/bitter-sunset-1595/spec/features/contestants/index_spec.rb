require 'rails_helper'

RSpec.describe 'Contestants Index Page' do
  Contestant.all.each do |contestant|
    before(:each) do
      visit '/contestants'
    end

    it 'shows all the contestant\'s names' do
      expect(page).to have_content(contestant.name)
    end

    it 'shows all the project names for each contestant' do
      expect(page).to have_content("Projects: #{contestant.projects.pluck(:name).join(', ')}")
    end
  end
end
