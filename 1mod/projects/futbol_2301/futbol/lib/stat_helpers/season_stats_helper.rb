module SeasonStatsHelper
  def winningest_or_worst_coach(is_best: true, season_year:)
    coach_win_ratios = coach_win_rates(season_year)
    is_best ? coach_win_ratios.max_by { |_, win_rate| win_rate }.first :
              coach_win_ratios.min_by { |_, win_rate| win_rate }.first
  end

  def coach_win_rates(season_year)
    coach_game_counts(season_year).merge(coach_win_counts(season_year)) do
      |coach, game_count, win_count|
      win_rate = win_count.fdiv(game_count)
      win_rate.nan? ? 0 : win_rate
    end
  end

  def coach_win_counts(season_year)
    season = get_season(season_year)
    coaches = get_coaches_by_season(season_year)
    coaches.map do |coach|
      coach_win_count = season.games.filter do |game|
        (game.team_stats[:home_team][:head_coach] == coach &&
         game.team_stats[:home_team][:result] == 'WIN') ||
        (game.team_stats[:away_team][:head_coach] == coach &&
         game.team_stats[:away_team][:result] == 'WIN')
      end.count
      [coach, coach_win_count]
    end.to_h
  end

  def coach_game_counts(season_year)
    season = get_season(season_year)
    coaches = get_coaches_by_season(season_year)
    coaches.map do |coach|
      coach_game_count = season.games.filter do |game|
        game.team_stats[:home_team][:head_coach] == coach ||
        game.team_stats[:away_team][:head_coach] == coach
      end.count
      [coach, coach_game_count]
    end.to_h
  end

  def get_season(season_year)
    @league.seasons.find { |season| season.year == season_year }
  end

  def get_coaches_by_season(season_year)
    season = get_season(season_year)
    season.games.map do |game|
    [
      game.team_stats[:home_team][:head_coach],
      game.team_stats[:away_team][:head_coach]
    ]
    end.flatten.uniq
  end

  def team_accuracies_by_season(season_year)
    team_goals = team_goal_counts_by_season(season_year)
    team_shots = team_shot_counts_by_season(season_year)
    team_goals.merge(team_shots) do |team, goal_count, shot_count|
      accuracy = goal_count.fdiv(shot_count)
      accuracy.nan? ? 0 : accuracy
    end
  end

  def team_goal_counts_by_season(season_year)
    season = get_season(season_year)
    season.teams.map do |team|
      team_games = team_games_by_season(team, season_year)
      team_goal_count = team_games.reduce(0) do |sum, game|
        is_home = game.info[:home_team_id] == team.id
        sum + game.info[is_home ? :home_goals : :away_goals]
      end
      [team.name, team_goal_count]
    end.to_h
  end

  def team_shot_counts_by_season(season_year)
    season = get_season(season_year)
    season.teams.map do |team|
      team_games = team_games_by_season(team, season_year)
      team_shot_count = team_games.reduce(0) do |sum, game|
        is_home = game.info[:home_team_id] == team.id
        sum + game.team_stats[is_home ? :home_team : :away_team][:shots]
      end
      [team.name, team_shot_count]
    end.to_h
  end

  def team_games_by_season(team, season_year)
    season = get_season(season_year)
    season.games.filter do |game|
      game.info[:home_team_id] == team.id ||
      game.info[:away_team_id] == team.id
    end
  end

  def team_tackles(season_year)
    season = get_season(season_year)
    season.teams.map do |team|
      team_games = team_games_by_season(team, season_year)
      tackles = team_games.reduce(0) do |sum, game|
        is_home = game.info[:home_team_id] == team.id
        sum + game.team_stats[is_home ? :home_team : :away_team][:tackles]
      end
      [team.name, tackles]
    end.to_h
  end
end
