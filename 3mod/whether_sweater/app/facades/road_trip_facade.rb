require 'date'
require 'time'

class RoadTripFacade
  def get_road_trip(origin, destination)
    map_facade = MapFacade.new
    coords = map_facade.get_city_lat_lng(destination)

    route = map_facade.get_route(origin, destination)
    is_impossible_route = route[:travel_time] == 'impossible route'
    if is_impossible_route
      road_trip = route
      road_trip[:weather_at_eta] = {}
    else
      days = route[:travel_time] / 86400
      forecast = WeatherForecastService.new.get_future_day_forecast(coords[:lat], coords[:lng], days + 1)
      weather_at_eta = get_weather_at_eta(forecast, route[:travel_time], days)

      road_trip = route
      hours = route[:travel_time] / 3600
      minutes = (route[:travel_time] % 3600) / 60
      seconds = ((route[:travel_time] % 3600) % 60) / 60

      road_trip[:travel_time] = "#{hours}:#{minutes}:#{seconds}"
      road_trip[:weather_at_eta] = weather_at_eta
    end
    RoadTrip.new(road_trip)
  end

  private

  def get_weather_at_eta(forecast, travel_time, days)
    left_over_seconds = travel_time - (days * 86400)
    hour = left_over_seconds / 3600
    hour_forecast = forecast[:hour][hour]
    {
      datetime: get_datetime(travel_time),
      temperature: hour_forecast[:temp_f],
      condition: hour_forecast[:condition][:text]
    }
  end

  def get_datetime(travel_time)
    time = Time.now + travel_time

    "#{time.year}-#{time.month}-#{time.day} #{time.hour}:#{time.min}"
  end
end
