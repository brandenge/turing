require_relative '../stat_helpers/league_stats_helper'

module LeagueStats
  include LeagueStatsHelper

  def count_of_teams
    @league.teams.count
  end

  def best_offense
    team_goals_per_game.max_by { |team, goals_per_game| goals_per_game }.first
  end

  def worst_offense
    team_goals_per_game.min_by { |team, goals_per_game| goals_per_game }.first
  end

  def highest_scoring_visitor
    high_low_scoring_home_away_team(is_home: false)
  end

  def lowest_scoring_visitor
    high_low_scoring_home_away_team(is_highest: false, is_home: false)
  end

  def highest_scoring_home_team
    high_low_scoring_home_away_team
  end

  def lowest_scoring_home_team
    high_low_scoring_home_away_team(is_highest: false)
  end
end
