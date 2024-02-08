require_relative '../stat_helpers/season_stats_helper'

module SeasonStats
  include SeasonStatsHelper

  def winningest_coach(season_year)
    winningest_or_worst_coach(is_best: true, season_year: season_year)
  end

  def worst_coach(season_year)
    winningest_or_worst_coach(is_best: false, season_year: season_year)
  end

  def most_accurate_team(season_year)
    team_accuracies_by_season(season_year).max_by { |team, accuracy| accuracy }
      .first
  end

  def least_accurate_team(season_year)
    team_accuracies_by_season(season_year).min_by { |team, accuracy| accuracy }
      .first
  end

  def most_tackles(season_year)
    team_tackles(season_year).max_by { |team, tackles| tackles }.first
  end

  def fewest_tackles(season_year)
    team_tackles(season_year).min_by { |team, tackles| tackles }.first
  end
end
