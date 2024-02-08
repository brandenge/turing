class BoredApiService
  def get_activities_for_weather(temperature)
    activity1 = get_url('/api/activity?type=relaxation')

    activity_type = case
    when temperature >= 60 then 'recreational'
    when temperature >= 50 then 'busywork'
    else 'cooking'
    end

    activity2 = get_url("/api/activity?type=#{activity_type}")
    [activity1, activity2]
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'http://www.boredapi.com',
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end
