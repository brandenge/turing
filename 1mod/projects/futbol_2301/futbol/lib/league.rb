require_relative './season'
require_relative './team'

class League
  attr_reader :name,
              :teams,
              :games,
              :seasons

  def initialize(name, data)
    @name = name
    @teams = create_teams(data[:teams])
    @games = create_games(data)
    @seasons = create_seasons(data)
  end

  def create_teams(teams_data)
    teams_data.map { |team_data| Team.new(team_data) }
  end

  def create_games(data)
    data[:games].map do |game|
      game_teams = data[:game_teams].filter do |game_team|
        game_team[:game_id] == game[:game_id]
      end

      game_teams = set_home_and_away(game, game_teams)

      teams = {
        home_team: get_team(game, :home_team_id),
        away_team: get_team(game, :away_team_id)
      }

      Game.new(game, game_teams, teams)
    end
  end

  def get_team(game, team_id)
    @teams.find { |team| team.id == game[team_id] }
  end

  def set_home_and_away(game, game_teams)
    if game[:home_team_id] == game_teams.first[:team_id]
      {
        home_team: game_teams.first,
        away_team: game_teams.last
      }
    else
      {
        home_team: game_teams.last,
        away_team: game_teams.first
      }
    end
  end

  def create_seasons(data)
    seasons = get_season_years
    seasons.map do |season|
      season_games = filter_games_by_season(season)
      season_teams = filter_teams_by_season(season, season_games)
      Season.new(season, season_games, season_teams)
    end
  end

  def get_season_years
    @games.uniq { |game| game.info[:season] }.map { |game| game.info[:season] }
  end

  def filter_games_by_season(season)
    @games.filter { |game| game.info[:season] == season }
  end

  def filter_teams_by_season(season, season_games)
    @teams.filter do |team|
      get_team_ids_by_season(season_games).include?(team.id)
    end
  end

  def get_team_ids_by_season(season_games)
    season_games.map do |game|
      [game.info[:home_team_id], game.info[:away_team_id]]
    end.flatten.uniq
  end
end
