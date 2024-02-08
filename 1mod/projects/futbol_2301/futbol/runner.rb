require './lib/stat_tracker'

game_path = './spec/fixtures/games_sample.csv'
team_path = './data/teams.csv'
game_teams_path = './spec/fixtures/game_teams_sample.csv'

locations = {
  games: game_path,
  teams: team_path,
  game_teams: game_teams_path
}

stat_tracker = StatTracker.from_csv(locations)

puts <<~STATS
  GAME STATS:
    The highest overall score in a game: #{stat_tracker.highest_total_score}
    The lowest overall score in a game: #{stat_tracker.highest_total_score}
    The overall percentage of home team wins: #{stat_tracker.percentage_home_wins}
    The overall percentage of away team wins: #{stat_tracker.percentage_visitor_wins}
    The overall percentage of ties: #{stat_tracker.percentage_ties}
    The number of games in every season: #{stat_tracker.count_of_games_by_season}
    The average goals per game overall: #{stat_tracker.average_goals_per_game}
    The average goals for each season: #{stat_tracker.average_goals_by_season}

  LEAGUE STATS:
    The number of teams in the league: #{stat_tracker.count_of_teams}
    The team with the best offense in the league: #{stat_tracker.best_offense}
    The team with the worst offense in the league: #{stat_tracker.worst_offense}
    The team with the highest goals per game as the away team: #{stat_tracker.highest_scoring_visitor}
    The team with the lowest goals per game as the away team: #{stat_tracker.lowest_scoring_visitor}
    The team with the highest goals per game as the home team: #{stat_tracker.highest_scoring_home_team}
    The team with the lowest goals per game as the home team: #{stat_tracker.lowest_scoring_home_team}

  2012-2013 SEASON STATS:
    The winngest coach: #{stat_tracker.winningest_coach('20122013')}
    The worst coach: #{stat_tracker.worst_coach('20122013')}
    The most accurate team: #{stat_tracker.most_accurate_team('20122013')}
    The least accurate team: #{stat_tracker.least_accurate_team('20122013')}
    The team with the most tackles: #{stat_tracker.most_tackles('20122013')}
    The team with the least tackles: #{stat_tracker.fewest_tackles('20122013')}

  2013-2014 SEASON STATS:
    The winngest coach: #{stat_tracker.winningest_coach('20132014')}
    The worst coach: #{stat_tracker.worst_coach('20132014')}
    The most accurate team: #{stat_tracker.most_accurate_team('20132014')}
    The least accurate team: #{stat_tracker.least_accurate_team('20132014')}
    The team with the most tackles: #{stat_tracker.most_tackles('20132014')}
    The team with the least tackles: #{stat_tracker.fewest_tackles('20132014')}
STATS
