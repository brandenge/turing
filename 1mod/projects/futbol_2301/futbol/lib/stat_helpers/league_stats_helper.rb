module LeagueStatsHelper
  def team_goals_per_game
    team_goal_counts.merge(team_game_counts) do |team, goal_count, game_count|
      result = goal_count.fdiv(game_count)
      result.nan? ? 0 : result
    end
  end

  def team_goal_counts
    @league.teams.map do |team|
      team_games = @league.games.filter do |game|
        game.info[:home_team_id] == team.id ||
        game.info[:away_team_id] == team.id
      end
      team_goal_count = team_games.map do |game|
        game.info[:home_team_id] == team.id ?
        game.info[:home_goals] : game.info[:away_goals]
      end.sum
      [team.name, team_goal_count]
    end.to_h
  end

  def team_game_counts
    @league.teams.map do |team|
      team_game_count = @league.games.filter do |game|
        game.info[:home_team_id] == team.id ||
        game.info[:away_team_id] == team.id
      end.count
      [team.name, team_game_count]
    end.to_h
  end

  def high_low_scoring_home_away_team(is_highest: true, is_home: true)
    team_goals_per_game = team_home_or_away_goals_per_game(is_home: is_home)
    is_highest ?
    team_goals_per_game.max_by { |team, goals_per_game| goals_per_game }.first :
    team_goals_per_game.min_by { |team, goals_per_game| goals_per_game }.first
  end

  def team_home_or_away_goals_per_game(is_home: true)
    goal_counts = team_home_or_away_goal_counts(is_home: is_home)
    game_counts = team_home_or_away_game_counts(is_home: is_home)
    goal_counts.merge(game_counts) do |team, goal_count, game_count|
      goals_per_game = goal_count.fdiv(game_count)
      goals_per_game.nan? ? 0 : goals_per_game
    end
  end

  def team_home_or_away_goal_counts(is_home: true)
    @league.teams.map do |team|
      team_games = team_home_or_away_games(is_home: is_home)[team.name]
      team_goals = team_games.reduce(0) do |sum, game|
        sum + game.info[is_home ? :home_goals : :away_goals]
      end
      [team.name, team_goals]
    end.to_h
  end

  def team_home_or_away_game_counts(is_home: true)
    @league.teams.map do |team|
      [team.name, team_home_or_away_games(is_home: is_home)[team.name].count]
    end.to_h
  end

  def team_home_or_away_games(is_home: true)
    @league.teams.map do |team|
      team_games = @league.games.filter do |game|
        game.info[is_home ? :home_team_id : :away_team_id] == team.id
      end
      [team.name, team_games]
    end.to_h
  end
end
