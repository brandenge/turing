require 'spec_helper'

RSpec.describe Season do
  let(:team_1) { Team.new(DATA[:teams][5]) }
  let(:team_2) { Team.new(DATA[:teams][4]) }

  let(:game_1) do
    game = DATA[:games][0]
    game_teams = {
      home_team: DATA[:game_teams][0],
      away_team: DATA[:game_teams][1]
    }
    teams = {
      home_team: team_1,
      away_team: team_2
    }
    Game.new(game, game_teams, teams)
  end

  let(:game_2) do
    game = DATA[:games][1]
    game_teams = {
      home_team: DATA[:game_teams][1],
      away_team: DATA[:game_teams][0]
    }
    teams = {
      home_team: team_1,
      away_team: team_2
    }
    Game.new(game, game_teams, teams)
  end

  let(:season_1) { Season.new('20122013', [game_1, game_2], [team_1, team_2]) }
  let(:season_2) { Season.new('20132014', [game_2, game_1], [team_2, team_1]) }

  describe '#initialize' do
    it 'exists' do
      expect(season_1).to be_a(Season)
      expect(season_2).to be_a(Season)
    end
  end

  describe '#year' do
    it 'has a year' do
      expect(season_1.year).to eq('20122013')
      expect(season_2.year).to eq('20132014')
    end
  end

  describe '#games' do
    it 'has a list of games' do
      actual_1 = season_1.games.all? { |game| game.is_a?(Game) }
      expect(actual_1).to eq(true)
      actual_2 = season_2.games.all? { |game| game.is_a?(Game) }
      expect(actual_2).to eq(true)
      expect(season_1.games).to eq([game_1, game_2])
      expect(season_2.games).to eq([game_2, game_1])
    end
  end

  describe '#teams' do
    it 'has a list of teams' do
      actual_1 = season_1.teams.all? { |team| team.is_a?(Team) }
      expect(actual_1).to eq(true)
      actual_2 = season_2.teams.all? { |team| team.is_a?(Team) }
      expect(actual_2).to eq(true)
      expect(season_1.teams).to eq([team_1, team_2])
      expect(season_2.teams).to eq([team_2, team_1])
    end
  end
end
