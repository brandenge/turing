require 'spec_helper'

RSpec.describe League do
  subject(:league) { League.new(:futbol, DATA) }

  describe '#initialize' do
    it 'exists' do
      expect(league).to be_a(League)
    end
  end

  describe '#name' do
    it 'has a name' do
      expect(league.name).to eq(:futbol)
    end
  end

  describe '#teams' do
    it 'has a list of teams' do
      actual = league.teams.all? { |team| team.is_a?(Team) }
      expect(actual).to eq(true)
    end

    it 'instantiates team objects with the correct data' do
      expected_1 = {
        abbreviation: 'ATL',
        franchise_id: '23',
        id: '1',
        link: '/api/v1/teams/1',
        name: 'Atlanta United',
        stadium: 'Mercedes-Benz Stadium'
      }
      expected_2 = {
        abbreviation: 'CCS',
        franchise_id: '28',
        id: '53',
        link: '/api/v1/teams/53',
        name: 'Columbus Crew SC',
        stadium: 'Mapfre Stadium'
      }

      expect(league.teams.first.abbreviation).to eq(expected_1[:abbreviation])
      expect(league.teams.first.franchise_id).to eq(expected_1[:franchise_id])
      expect(league.teams.first.id).to eq(expected_1[:id])
      expect(league.teams.first.link).to eq(expected_1[:link])
      expect(league.teams.first.name).to eq(expected_1[:name])
      expect(league.teams.first.stadium).to eq(expected_1[:stadium])

      expect(league.teams.last.abbreviation).to eq(expected_2[:abbreviation])
      expect(league.teams.last.franchise_id).to eq(expected_2[:franchise_id])
      expect(league.teams.last.id).to eq(expected_2[:id])
      expect(league.teams.last.link).to eq(expected_2[:link])
      expect(league.teams.last.name).to eq(expected_2[:name])
      expect(league.teams.last.stadium).to eq(expected_2[:stadium])
    end
  end

  describe '#games' do
    it 'has a list of games' do
      actual = league.games.all? { |season| season.is_a?(Game) }
      expect(actual).to eq(true)
    end

    it 'instantiates game objects with the correct data' do
      expect(league.games.first.info[:game_id]).to eq('2012030221')
      expect(league.games.last.info[:game_id]).to eq('2017020156')
    end
  end

  describe '#seasons' do
    it 'has a list of seasons' do
      actual = league.seasons.all? { |season| season.is_a?(Season) }
      expect(actual).to eq(true)
    end

    it 'instantiates season objects with the correct data' do
      expect(league.seasons.first.year).to eq('20122013')
      expect(league.seasons.last.year).to eq('20172018')
    end
  end

  describe '#create_teams' do
    it 'returns a list of team objects' do
      actual = league.create_teams(DATA[:teams]).all? do |team|
        team.is_a?(Team)
      end
      expect(actual).to eq(true)
    end
  end

  describe '#get_team' do
    it 'returns a team object from a game' do
      expect(league.get_team(GAME_DATA_1, :home_team_id)).to be_a(Team)
      expect(league.get_team(GAME_DATA_1, :home_team_id).id).to eq('6')
      expect(league.get_team(GAME_DATA_1, :away_team_id)).to be_a(Team)
      expect(league.get_team(GAME_DATA_1, :away_team_id).id).to eq('3')

      expect(league.get_team(GAME_DATA_2, :home_team_id)).to be_a(Team)
      expect(league.get_team(GAME_DATA_2, :home_team_id).id).to eq('6')
      expect(league.get_team(GAME_DATA_2, :away_team_id)).to be_a(Team)
      expect(league.get_team(GAME_DATA_2, :away_team_id).id).to eq('26')
    end
  end

  describe '#set_home_and_away' do
    it 'returns a hash' do
      expect(league.set_home_and_away(GAME_DATA_1, GAME_TEAMS_DATA_1)).to be_a(Hash)
      expect(league.set_home_and_away(GAME_DATA_2, GAME_TEAMS_DATA_2)).to be_a(Hash)
    end

    it 'it assigns the home team and away team correctly' do
      expect(league.set_home_and_away(GAME_DATA_1, GAME_TEAMS_DATA_1)[:home_team][:hoa]).to eq('home')
      expect(league.set_home_and_away(GAME_DATA_1, GAME_TEAMS_DATA_1)[:away_team][:hoa]).to eq('away')
    end
  end

  describe '#create_seasons' do
    it 'returns a list of season objects' do
      actual = league.create_seasons(DATA).all? do |season|
        season.is_a?(Season)
      end
      expect(actual).to eq(true)
    end
  end

  describe '#get_season_years' do
    it 'returns a list of season years' do
      expected = [
        '20122013', '20132014', '20142015', '20152016', '20162017', '20172018'
      ]
      expect(league.get_season_years).to eq(expected)
    end
  end

  describe '#filter_games_by_season' do
    it 'returns a list of games from a season' do
      actual_1 = league.filter_games_by_season('20122013').all? do |game|
        game.is_a?(Game)
      end
      actual_2 = league.filter_games_by_season('20132014').all? do |game|
        game.is_a?(Game)
      end
      expect(actual_1).to eq(true)
      expect(actual_2).to eq(true)
    end

    it 'returns the correct list of games from the season' do
      actual_1 = league.filter_games_by_season('20122013')
      actual_2 = league.filter_games_by_season('20132014')

      expect(actual_1.first.info[:season]).to eq('20122013')
      expect(actual_1.last.info[:season]).to eq('20122013')
      expect(actual_2.first.info[:season]).to eq('20132014')
      expect(actual_2.last.info[:season]).to eq('20132014')
    end
  end

  describe '#filter_teams_by_season' do
    before(:each) do
      @season_1_games = league.filter_games_by_season('20122013')
      @season_2_games = league.filter_games_by_season('20132014')
    end

    it 'returns a list of teams' do
      actual_1 = league.filter_teams_by_season('20122013', @season_1_games)
        .all? { |team| team.is_a?(Team) }
      actual_2 = league.filter_teams_by_season('20132014', @season_2_games)
        .all? { |team| team.is_a?(Team) }

      expect(actual_1).to eq(true)
      expect(actual_2).to eq(true)
    end

    it 'returns the correct list of teams from the season' do
      season_1_teams =
        league.filter_teams_by_season('20122013', @season_1_games)
      season_2_teams =
        league.filter_teams_by_season('20132014', @season_2_games)

      actual_1 = league.get_team_ids_by_season(@season_1_games)
        .include?(season_1_teams.first.id)
      actual_2 = league.get_team_ids_by_season(@season_2_games)
        .include?(season_2_teams.first.id)

      expect(actual_1).to eq(true)
      expect(actual_2).to eq(true)
    end
  end

  describe '#get_team_ids_by_season' do
    it 'returns the correct list of team ids for the season' do
      season_1_games = league.filter_games_by_season('20122013')
      season_2_games = league.filter_games_by_season('20132014')

      expected_1 = [
        '6', '3', '24', '29', '12', '2', '1', '27', '26', '30', '7', '15', '20', '16', '13', '18', '17', '9', '10', '4', '52', '14', '5', '23'
      ]
      expected_2 = [
        '23', '19', '4', '24', '29', '17', '15', '18', '20', '6', '2', '5', '22', '28', '10', '13', '1'
      ]

      expect(league.get_team_ids_by_season(season_1_games)).to eq(expected_1)
      expect(league.get_team_ids_by_season(season_2_games)).to eq(expected_2)
    end
  end
end
