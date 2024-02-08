require 'spec_helper'

RSpec.describe StatTracker do
  subject(:stat_tracker) { StatTracker.new(:futbol, DATA) }

  describe '#winningest_coach' do
    it 'can find the winningest coach based on the season' do
      expect(stat_tracker.winningest_coach("20132014")).to eq("John Tortorella")
      expect(stat_tracker.winningest_coach("20122013")).to eq("Claude Julien")
    end
  end

  describe '#worst_coach' do
    it 'can find the worst coach based on the season' do
      expect(stat_tracker.worst_coach("20132014")).to eq("Ken Hitchcock")
      expect(stat_tracker.worst_coach("20122013")).to eq("John Tortorella")
    end
  end

  describe '#most_accurate_team' do
    it 'returns the name of the team with the best ratio of shots to goals for the season' do
      expect(stat_tracker.most_accurate_team("20132014")).to eq "Sporting Kansas City"
      expect(stat_tracker.most_accurate_team("20142015")).to eq "Atlanta United"
    end
  end

  describe '#least_accurate_team' do
    it 'returns the name of the team with the worst ratio of shots to goals for the season' do
      expect(stat_tracker.least_accurate_team("20132014")).to eq "Minnesota United FC"
      expect(stat_tracker.least_accurate_team("20142015")).to eq "Real Salt Lake"
    end
  end

  describe '#most_tackles' do
    it 'can check the most tackles of a season' do
      expect(stat_tracker.most_tackles("20132014")).to eq("LA Galaxy")
      expect(stat_tracker.most_tackles("20122013")).to eq("Houston Dynamo")
    end
  end

  describe '#fewest_tackles' do
    it 'can check the fewest tackles of a season' do
      expect(stat_tracker.fewest_tackles("20132014")).to eq("Atlanta United")
      expect(stat_tracker.fewest_tackles("20122013")).to eq("Toronto FC")
    end
  end
end
