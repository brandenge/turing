require_relative './game'

class Season
  attr_reader :year,
              :games,
              :teams

  def initialize(year, games, teams)
    @year = year
    @games = games
    @teams = teams
  end
end
