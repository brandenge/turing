class MoneyMarketService
  API_DOMAIN = 'http://localhost:3000/api/v0'.freeze

  def markets
    url = "#{API_DOMAIN}/markets"
    get_url(url)[:data].map do |market_data|
      format_market(market_data)
    end
  end

  def market(id)
    market_url = "#{API_DOMAIN}/markets/#{id}"
    market_data = get_url(market_url)[:data]

    market_vendors_url = "#{API_DOMAIN}/markets/#{id}/vendors"
    market_vendors_data = get_url(market_vendors_url)[:data]

    market = format_market(market_data)
    market[:vendors] = market_vendors_data.map do |market_vendor_data|
      format_vendor(market_vendor_data)
    end
    market
  end

  def vendor(id)
    vendor_url = "#{API_DOMAIN}/vendors/#{id}"
    vendor_data = get_url(vendor_url)[:data]

    format_vendor(vendor_data)
  end

  def markets_search(name:, city:, state:)
    markets_search_url = "#{API_DOMAIN}/markets/search"
    connection = Faraday.new(
      params: {
        name: name,
        city: city,
        state: state
      },
      headers: { 'Content-Type' => 'application/json' }
    )
    response = connection.get(markets_search_url)
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    if parsed_response[:data]
      parsed_response[:data].map do |market_data|
        format_market(market_data)
      end
    elsif parsed_response[:errors]
      parsed_response
    end
  end

  private

  def format_market(market_data)
    {
      id: market_data[:id].to_i,
      name: market_data[:attributes][:name],
      street: market_data[:attributes][:street],
      city: market_data[:attributes][:city],
      county: market_data[:attributes][:county],
      state: market_data[:attributes][:state],
      zip: market_data[:attributes][:zip],
      lat: market_data[:attributes][:lat],
      lon: market_data[:attributes][:lon]
    }
  end

  def format_vendor(vendor_data)
    {
      id: vendor_data[:id],
      name: vendor_data[:attributes][:name],
      description: vendor_data[:attributes][:description],
      contact_name: vendor_data[:attributes][:contact_name],
      contact_phone: vendor_data[:attributes][:contact_phone],
      credit_accepted: vendor_data[:attributes][:credit_accepted]
    }
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
