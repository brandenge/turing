class WeatherForecast
  attr_reader :id,
              :type,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(current_weather:, daily_weather:, hourly_weather:)
    @id = nil
    @type = 'forecast'
    @current_weather = CurrentWeather.new(current_weather)
    @daily_weather = daily_weather.map { |day| DailyWeather.new(day) }
    @hourly_weather = hourly_weather.map { |hour| HourlyWeather.new(hour) }
  end
end
