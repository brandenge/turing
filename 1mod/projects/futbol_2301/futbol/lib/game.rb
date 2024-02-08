require 'date'

class Game

  attr_reader :info,
              :team_stats,
              :teams

  def initialize(game, game_teams, teams)
    @info = {
      game_id: game[:game_id],
      date_time: Date.strptime(game[:date_time], "%D"),
      season: game[:season],
      home_team_id: game[:home_team_id],
      away_team_id: game[:away_team_id],
      home_goals: game[:home_goals].to_i,
      away_goals: game[:away_goals].to_i,
      settled_in: game_teams[:home_team][:settled_in],
      venue: game[:venue],
      venue_link: game[:venue_link]
    }

    @team_stats = {
      home_team: set_team_stats(game_teams[:home_team]),
      away_team: set_team_stats(game_teams[:away_team])
    }

    @teams = teams
  end

  def set_team_stats(team)
    {
      home_or_away: team[:hoa],
      result: team[:result],
      head_coach: team[:head_coach],
      goals: team[:goals].to_i,
      shots: team[:shots].to_i,
      tackles: team[:tackles].to_i,
      penalty_minutes: team[:pim].to_i,
      power_play_opportunities: team[:powerplayopportunities].to_i,
      power_play_goals: team[:powerplaygoals].to_i,
      face_off_win_percentage: team[:faceoffwinpercentage].to_f,
      giveaways: team[:giveaways].to_i,
      takeaways: team[:takeaways].to_i,
    }
  end
end
