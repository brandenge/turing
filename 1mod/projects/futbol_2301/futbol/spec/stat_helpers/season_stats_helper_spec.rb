require 'spec_helper'

RSpec.describe StatTracker do
  subject(:stat_tracker) { StatTracker.new(:futbol, DATA) }

  let(:team_1) { Team.new(DATA[:teams][5]) }
  let(:team_2) { Team.new(DATA[:teams][4]) }

  describe '#winningest_or_worst_coach' do
    it 'can return an array with all coaches total wins and losses' do
      expect(stat_tracker.winningest_or_worst_coach(
        season_year: '20122013')).to eq('Claude Julien')
      expect(stat_tracker.winningest_or_worst_coach(
        is_best: false, season_year: '20122013')).to eq('John Tortorella')
      expect(stat_tracker.winningest_or_worst_coach(
        season_year: '20132014')).to eq('John Tortorella')
      expect(stat_tracker.winningest_or_worst_coach(
        is_best: false, season_year: '20132014')).to eq('Ken Hitchcock')
    end
  end

  describe '#coach_game_counts' do
    it 'can return an arrary of hashes indicating how many total games each coach has coached in the indicated season' do
      expect(stat_tracker.coach_game_counts('20122013'))
        .to eq(COACH_GAME_COUNTS_1)
      expect(stat_tracker.coach_game_counts('20132014'))
        .to eq(COACH_GAME_COUNTS_2)
    end
  end

  describe '#coach_win_rates' do
    it 'returns the win rates for each coach' do
      expect(stat_tracker.coach_win_rates('20122013')).to eq(COACH_WIN_RATES_1)
      expect(stat_tracker.coach_win_rates('20132014')).to eq(COACH_WIN_RATES_2)
    end
  end

  describe '#coach_win_counts' do
    it 'returns the win counts for each coach' do
      expect(stat_tracker.coach_win_counts('20122013'))
        .to eq(COACH_WIN_COUNTS_1)
      expect(stat_tracker.coach_win_counts('20132014'))
        .to eq(COACH_WIN_COUNTS_2)
    end
  end

  describe '#coach_game_counts' do
    it 'returns the number of games for each coach' do
      expect(stat_tracker.coach_game_counts('20122013'))
        .to eq(COACH_GAME_COUNTS_1)
      expect(stat_tracker.coach_game_counts('20132014'))
        .to eq(COACH_GAME_COUNTS_2)
    end
  end

  describe '#get_season' do
    it 'returns a Season object' do
      expect(stat_tracker.get_season('20122013')).to be_a(Season)
      expect(stat_tracker.get_season('20132014')).to be_a(Season)
    end

    it 'returns the season object for the given season year' do
      expect(stat_tracker.get_season('20122013').year).to eq('20122013')
      expect(stat_tracker.get_season('20132014').year).to eq('20132014')
    end
  end

  describe '#get_coaches_by_season' do
    it 'returns a list of head coach names for a given season' do
      expect(stat_tracker.get_coaches_by_season('20122013')).to be_a(Array)
      expect(stat_tracker.get_coaches_by_season('20132014')).to be_a(Array)
    end

    it 'returns the correct coaches' do
      expect(stat_tracker.get_coaches_by_season('20122013'))
        .to eq(SEASON_1_COACHES)
      expect(stat_tracker.get_coaches_by_season('20132014'))
        .to eq(SEASON_2_COACHES)
    end
  end

  describe '#team_accuracies_by_season' do
    it 'returns a hash' do
      expect(stat_tracker.team_accuracies_by_season('20122013')).to be_a(Hash)
      expect(stat_tracker.team_accuracies_by_season('20132014')).to be_a(Hash)
    end

    it 'returns a hash of team keys and team accuracies as values per season' do
      expect(stat_tracker.team_accuracies_by_season('20122013'))
        .to eq(TEAM_ACCURACIES_SEASON_1)
      expect(stat_tracker.team_accuracies_by_season('20132014'))
        .to eq(TEAM_ACCURACIES_SEASON_2)
    end
  end

  describe '#team_goal_counts_by_season' do
    it 'returns a hash of team keys and goal counts as values per season' do
      expect(stat_tracker.team_goal_counts_by_season('20122013'))
        .to eq(TEAM_GOAL_COUNTS_SEASON_1)
      expect(stat_tracker.team_goal_counts_by_season('20132014'))
        .to eq(TEAM_GOAL_COUNTS_SEASON_2)
    end
  end

  describe '#team_shot_counts_by_season' do
    it 'returns a hash of team keys and accuracy values per season' do
      expect(stat_tracker.team_shot_counts_by_season('20122013'))
        .to eq(TEAM_SHOT_COUNTS_SEASON_1)
      expect(stat_tracker.team_shot_counts_by_season('20132014'))
        .to eq(TEAM_SHOT_COUNTS_SEASON_2)
    end
  end

  describe '#team_games_by_season' do
    it 'returns an array of games for a given team in a given season' do
      expect(stat_tracker.team_games_by_season(team_1, '20122013'))
        .to be_a(Array)
      expect(stat_tracker.team_games_by_season(team_2, '20132014'))
        .to be_a(Array)
    end

    it 'returns the correct games for the team\'s season' do
      expect(stat_tracker.team_games_by_season(
        team_1, '20122013').first.info[:game_id]).to eq('2012030221')
      expect(stat_tracker.team_games_by_season(
        team_2, '20132014').first.info[:game_id]).to eq('2013020021')
    end
  end

  describe '#team_tackles' do
    it 'returns a hash' do
      expect(stat_tracker.team_tackles('20122013')).to be_a(Hash)
      expect(stat_tracker.team_tackles('20132014')).to be_a(Hash)
    end

    it 'returns a hash of the teams as keys and the amount of tackles in the season as the value' do
      expect(stat_tracker.team_tackles('20122013')).to eq(TEAM_TACKLES_COUNT_1)
      expect(stat_tracker.team_tackles('20132014')).to eq(TEAM_TACKLES_COUNT_2)
    end
  end
end
