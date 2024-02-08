require 'csv'
require_relative './league'
require_relative './stats/league_stats'
require_relative './stats/team_stats'
require_relative './stats/game_stats'
require_relative './stats/season_stats'

class StatTracker
  include LeagueStats
  include TeamStats
  include GameStats
  include SeasonStats

  attr_reader :league

  def self.from_csv(locations)
    parsed_data = locations.map do |key, csv_file_path|
      csv_rows = CSV.open(csv_file_path,
                           headers: true,
                           header_converters: :symbol)

      converted_from_csv = csv_rows.map { |row| row.to_h }
      [key, converted_from_csv]
    end.to_h
    self.new(:futbol, parsed_data)
  end

  def initialize(league_name, data)
    @league = League.new(league_name, data)
  end
end
