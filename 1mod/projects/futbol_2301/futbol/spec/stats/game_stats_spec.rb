require 'spec_helper'

RSpec.describe StatTracker do
  subject(:stat_tracker) { StatTracker.new(:futbol, DATA) }

  describe '#highest_total_score' do
    it 'can find the score of the highest scoring game' do
      expect(stat_tracker.highest_total_score).to eq(6)
    end
  end

  describe '#lowest_total_score' do
    it 'can find the total score of the lowest scoring game' do
      expect(stat_tracker.lowest_total_score).to eq(1)
    end
  end

  describe '#percentage_home_wins' do
    it 'can find the percentage of home wins' do
      expect(stat_tracker.percentage_home_wins).to eq(0.45)
    end
  end

  describe '#percentage_visitor_wins' do
    it 'can find the percentage of visitor wins' do
      expect(stat_tracker.percentage_visitor_wins).to eq(0.37)
    end
  end

  describe '#percentage_ties' do
    it 'can find the percentage of ties' do
      expect(stat_tracker.percentage_ties).to eq(0.18)
    end
  end

  describe '#count_of_games_by_season' do
    it 'returns a hash of the number of games(values) per season(keys)' do
      expected_hash = {
        "20122013" => 21,
        "20132014" => 13,
        "20142015" => 1,
        "20152016" => 1,
        "20162017" => 1,
        "20172018" => 1
      }

      expect(stat_tracker.count_of_games_by_season).to eq(expected_hash)
    end
  end

  describe '#average_goals_per_game' do
    it 'returns the average number of goals per game' do
      expect(stat_tracker.average_goals_per_game).to eq(4.24)
    end
  end

  describe '#average_goals_by_season' do
    it 'returns a hash of the average goals(values) by season(keys)' do
      expected_hash = {
        "20122013" => 4.43,
        "20132014" => 4.08,
        "20142015" => 4.00,
        "20152016" => 5.00,
        "20162017" => 3.00,
        "20172018" => 3.00
      }

      expect(stat_tracker.average_goals_by_season).to eq(expected_hash)
    end
  end
end
