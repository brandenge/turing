class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :condition,
              :icon

  def initialize(data)
    @date = data[:date]
    @sunrise = data[:sunrise]
    @sunset = data[:sunset]
    @max_temp = data[:max_temp]
    @min_temp = data[:min_temp]
    @condition = data[:condition]
    @icon = data[:icon]
  end
end
