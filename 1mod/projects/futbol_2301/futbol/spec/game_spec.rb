require 'spec_helper'

RSpec.describe Game do
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

  describe '#initialize' do
    it 'exists' do
      expect(game_1).to be_a(Game)
      expect(game_2).to be_a(Game)
    end
  end

  describe '#info' do
    it 'has a hash of game information' do
      expect(game_1.info).to be_a(Hash)
      expect(game_2.info).to be_a(Hash)
    end

    it 'stores game data in each hash key' do
      expect(game_1.info).to eq(GAME_INFO_1)
      expect(game_2.info).to eq(GAME_INFO_2)
    end
  end

  describe '#team_stats' do
    it 'has a hash of team_stats' do
      expect(game_1.team_stats).to be_a(Hash)
      expect(game_2.team_stats).to be_a(Hash)
    end

    it 'stores game data in each hash key' do
      expect(game_1.team_stats).to eq(TEAM_STATS_1)
      expect(game_2.team_stats).to eq(TEAM_STATS_2)
    end
  end

  describe '#teams' do
    it 'has a hash of references to the home and away team objects' do
      expect(game_1.teams).to be_a(Hash)
      expect(game_2.teams).to be_a(Hash)
    end

    it 'has keys for the home team and away team' do
      expect(game_1.teams).to have_key(:home_team)
      expect(game_1.teams).to have_key(:away_team)
    end

    it 'each key is a reference to a team object' do
      expect(game_1.teams[:home_team]).to be_a(Team)
      expect(game_1.teams[:away_team]).to be_a(Team)
    end
  end
end
