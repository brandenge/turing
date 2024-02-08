require 'spec_helper'

RSpec.describe StatTracker do
  subject(:stat_tracker) { StatTracker.new(:futbol, DATA) }

  describe '#count_of_teams' do
    it 'returns the number of teams' do
      expect(stat_tracker.count_of_teams).to eq(32)
    end
  end

  describe '#best_offense' do
    it 'returns the name of the team with the highest average of goals per game across all seasons' do
      expect(stat_tracker.best_offense).to eq("Sporting Kansas City")
    end
  end

  describe '#worst_offense' do
    it 'returns the name of the team with the highest average of goals per game across all seasons' do
      expect(stat_tracker.worst_offense).to eq("DC United")
    end
  end

  describe '#highest_scoring_visitor' do
    it "team with the highest average score per game across all seasons when they are away" do
      expect(stat_tracker.highest_scoring_visitor).to eq "Sporting Kansas City"
    end
  end

  describe '#highest_scoring_home_team' do
    it "team with the highest average score per game across all seasons when they are away" do
      expect(stat_tracker.highest_scoring_home_team).to eq "Sporting Kansas City"
    end
  end

  describe '#lowest_scoring_visitor' do
    it "team with the lowest average score per game across all seasons when they are away" do
      expect(stat_tracker.lowest_scoring_visitor).to eq "Chicago Fire"
    end
  end

  describe '#lowest_scoring_home_team' do
    it "team with the lowest average score per game across all seasons when they are away" do
      expect(stat_tracker.lowest_scoring_home_team).to eq "DC United"
    end
  end
end
