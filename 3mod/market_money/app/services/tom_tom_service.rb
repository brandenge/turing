class TomTomService
  API_DOMAIN = 'https://api.tomtom.com'.freeze
  BASE_URL = "https://api.tomtom.com/search/2/nearbySearch/.json?key=#{ENV['TOM_TOM_API_KEY']}&categorySet=7397".freeze

  def nearest_atms(lat, lon)
    url = "#{BASE_URL}&lat=#{lat}&lon=#{lon}"
    parsed_atms = get_url(url)[:results]
    atm_hashes(parsed_atms)
  end

  private

  def atm_hashes(parsed_response)
    parsed_response.map do |atm_data|
      {
        id: atm_data[:id],
        name: atm_data[:poi][:name],
        address: atm_data[:address][:freeformAddress],
        lat: atm_data[:position][:lat],
        lon: atm_data[:position][:lon],
        distance: atm_data[:dist]
      }
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: API_DOMAIN,
      headers: { 'Content-Type' => 'application/json' })
  end
end
