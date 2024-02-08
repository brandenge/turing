module GameStatsHelper
  def total_goals_per_game
    @league.games.map { |game| game.info[:home_goals] + game.info[:away_goals] }
  end

  def percentage_game_result(team, result)
    team_result_count = @league.games.count do |game|
      game.team_stats[team][:result] == result
    end
    percentage = team_result_count.fdiv(@league.games.count)
    percentage.nan? ? 0 : percentage.round(2)
  end

  def count_goals_by_season
    @league.seasons.map do |season|
      season_total_goals = season.games.map do |game|
        game.info[:home_goals] + game.info[:away_goals]
      end.sum
      [season.year, season_total_goals]
    end.to_h
  end
end
