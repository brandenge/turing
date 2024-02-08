require_relative '../stat_helpers/game_stats_helper'

module GameStats
  include GameStatsHelper

  def highest_total_score
    total_goals_per_game.max
  end

  def lowest_total_score
    total_goals_per_game.min
  end

  def percentage_home_wins
    percentage_game_result(:home_team, 'WIN')
  end

  def percentage_visitor_wins
    percentage_game_result(:home_team, 'LOSS')
  end

  def percentage_ties
    percentage_game_result(:home_team, 'TIE')
  end

  def count_of_games_by_season
    @league.seasons.map { |season| [season.year, season.games.count] }.to_h
  end

  def average_goals_per_game
    total_goals_per_game.sum.fdiv(@league.games.count).round(2)
  end

  def average_goals_by_season
    count_goals_by_season.merge(count_of_games_by_season) do
      |season, goals, games|
      goals_per_game = goals.fdiv(games).round(2)
      goals_per_game.nan? ? 0 : goals_per_game
    end
  end
end
