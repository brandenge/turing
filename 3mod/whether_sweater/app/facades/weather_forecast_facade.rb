class WeatherForecastFacade
  def get_forecast(coordinates)
    lat, lng = coordinates[:lat], coordinates[:lng]
    forecast_data = service.get_forecast(lat, lng)
    WeatherForecast.new(**forecast_data)
  end

  private

  def service
    @_service ||= WeatherForecastService.new
  end
end
