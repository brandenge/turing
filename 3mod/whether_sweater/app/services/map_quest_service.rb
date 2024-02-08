class MapQuestService
  def get_city_lat_lng(location)
    url = "/geocoding/v1/address?key=#{ENV['MAP_QUEST_API_KEY']}&location=#{location}"
    location_data = get_url(url)
    if valid_location?(location_data)
      location_data[:results].first[:locations].first[:latLng]
    end
  end

  def get_route(origin, destination)
    url = "/directions/v2/route?key=#{ENV['MAP_QUEST_API_KEY']}&from=#{origin}&to=#{destination}"
    route_data = get_url(url)
    is_possible_route = route_data[:info][:messages].empty?
    {
      start_city: format_location(origin),
      end_city: format_location(destination),
      travel_time:
        is_possible_route ? route_data[:route][:realTime] : 'impossible route'
    }
  end

  private

  def format_location(location)
    city, state = location.split(',')
    city.capitalize!
    "#{city}, #{state}"
  end

  def valid_location?(location_data)
    if location_data[:results].first[:locations].first[:source] == 'FALLBACK'
      raise CustomError.new('No location found. Please provide a known location query parameter.', 400)
    else
      true
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://www.mapquestapi.com',
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
