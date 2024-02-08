require 'spec_helper'

RSpec.describe StatTracker do
  subject(:stat_tracker) { StatTracker.new(:futbol, DATA) }

  describe '#total_goals_per_game' do
    it 'can return an array of the total score for all games' do
      expect(stat_tracker.total_goals_per_game).to eq([5, 5, 3, 5, 4, 3, 5, 5, 6, 4, 3, 5, 5, 6, 4, 3, 6, 4, 3, 5, 6, 3, 4, 5, 1, 5, 6, 2, 5, 3, 4, 5, 4, 4, 4, 5, 3, 3])
    end
  end

  describe '#percentage_game_result' do
    it 'returns the percentage of games that the home or away team won, lost, or tied' do
      expect(stat_tracker.percentage_game_result(:home_team, 'WIN'))
        .to eq(0.45)
      expect(stat_tracker.percentage_game_result(:home_team, 'LOSS'))
        .to eq(0.37)
      expect(stat_tracker.percentage_game_result(:home_team, 'TIE'))
        .to eq(0.18)
      expect(stat_tracker.percentage_game_result(:away_team, 'WIN'))
        .to eq(0.37)
      expect(stat_tracker.percentage_game_result(:away_team, 'LOSS'))
        .to eq(0.45)
      expect(stat_tracker.percentage_game_result(:away_team, 'TIE'))
        .to eq(0.18)
    end
  end

  describe '#count_goals_by_season' do
    it 'returns a hash' do
      expect(stat_tracker.count_goals_by_season).to be_a(Hash)
    end

    it 'returns a hash with the season year as keys and the season\'s total goals as values' do
      expected = {
        '20122013'=>93,
        '20132014'=>53,
        '20142015'=>4,
        '20152016'=>5,
        '20162017'=>3,
        '20172018'=>3
      }
      expect(stat_tracker.count_goals_by_season).to eq(expected)
    end
  end
end
