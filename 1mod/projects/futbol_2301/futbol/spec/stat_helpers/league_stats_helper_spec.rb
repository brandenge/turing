require 'spec_helper'

RSpec.describe StatTracker do
  subject(:stat_tracker) { StatTracker.new(:futbol, DATA) }

  describe '#team_goals_per_game' do
    it 'returns a hash with the keys as team names and the values as the avg of goals of all the seasons' do
      expect(stat_tracker.team_goals_per_game).to be_a(Hash)
    end
  end

  describe '#team_goal_counts' do
    it 'returns a hash of the teams as keys and the amount of goals in all season as the value' do
      expect(stat_tracker.team_goal_counts).to be_a(Hash)
    end
  end

  describe '#team_game_counts' do
    it 'returns a hash of the teams as keys and the amount of games in all season as the value' do
      expect(stat_tracker.team_game_counts).to be_a(Hash)
    end
  end

  describe '#high_low_scoring_home_away_team' do
    it 'returns the highest or lowest scoring team when home or away' do
      expect(stat_tracker.high_low_scoring_home_away_team).to eq('Sporting Kansas City')
      expect(stat_tracker.high_low_scoring_home_away_team(is_highest: false))
        .to eq('DC United')
      expect(stat_tracker.high_low_scoring_home_away_team(is_home: false))
        .to eq('Sporting Kansas City')
      expect(stat_tracker.high_low_scoring_home_away_team(
        is_highest:false, is_home: false
      )).to eq('Chicago Fire')
    end
  end

  describe '#team_home_or_away_goals_per_game' do
    it 'returns a hash' do
      expect(stat_tracker.team_home_or_away_goals_per_game).to be_a(Hash)
      expect(stat_tracker.team_home_or_away_goals_per_game(is_home: true))
        .to be_a(Hash)
    end

    it 'returns a hash with team names as keys and their average goals per game when either home or away' do
      expect(stat_tracker.team_home_or_away_goals_per_game)
        .to eq(TEAM_GOALS_PER_GAME_WHEN_AT_HOME)
      expect(stat_tracker.team_home_or_away_goals_per_game(is_home: false))
        .to eq(TEAM_GOALS_PER_GAME_WHEN_AWAY)
    end
  end

  describe '#team_home_or_away_goal_counts' do
    it 'returns a hash' do
      expect(stat_tracker.team_home_or_away_goal_counts)
        .to be_a(Hash)
      expect(stat_tracker.team_home_or_away_goal_counts(is_home: false))
        .to be_a(Hash)
    end

    it 'returns a hash with team names as keys and their total goals when either home or away' do
      expect(stat_tracker.team_home_or_away_goal_counts)
        .to eq(TEAM_GOAL_COUNTS_WHEN_AT_HOME)
      expect(stat_tracker.team_home_or_away_goal_counts(is_home: false))
        .to eq(TEAM_GOAL_COUNTS_WHEN_AWAY)
    end
  end


  describe '#team_home_or_away_game_counts' do
    it 'returns a hash' do
      expect(stat_tracker.team_home_or_away_game_counts)
        .to be_a(Hash)
      expect(stat_tracker.team_home_or_away_game_counts(is_home: false))
        .to be_a(Hash)
    end

    it 'returns a hash with team names as keys and their total number of games when either home or away' do
      expect(stat_tracker.team_home_or_away_game_counts)
        .to eq(TEAM_GAME_COUNTS_WHEN_AT_HOME)
      expect(stat_tracker.team_home_or_away_game_counts(is_home: false))
        .to eq(TEAM_GAME_COUNTS_WHEN_AWAY)
    end
  end


  describe '#team_home_or_away_games' do
    it 'returns a hash' do
      expect(stat_tracker.team_home_or_away_games)
        .to be_a(Hash)
      expect(stat_tracker.team_home_or_away_games(is_home: false))
        .to be_a(Hash)
    end

    it 'returns a hash with team names as keys and a list of their games as values' do
      expect(stat_tracker.team_home_or_away_games['Atlanta United']
        .first.info[:game_id]).to eq('2012020461')
      expect(stat_tracker.team_home_or_away_games['Utah Royals FC']
        .first.info[:game_id]).to eq('2012020511')
      expect(stat_tracker.team_home_or_away_games(
        is_home: false)['Atlanta United'].first.info[:game_id]).to eq('2012020122')
      expect(stat_tracker.team_home_or_away_games(
        is_home: false)['Utah Royals FC'].first.info[:game_id]).to eq('2012020161')
    end
  end
end
