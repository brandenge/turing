FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    api_key { Faker::Crypto.md5 }
  end

  current_temperature = Faker::Number.between(from: 0, to: 90)
  current_date = Faker::Time.between(from: DateTime.now - 10, to: DateTime.now)

  factory :current_weather do
    skip_create

    last_updated { current_date.strftime('%Y-%m-%d %H:%M') }
    temperature { current_temperature }
    feels_like {
      Faker::Number.between(from: current_temperature - 10, to: current_temperature + 10)
    }
    humidity { Faker::Number.between(from: 1, to: 100) }
    uvi { Faker::Number.between(from: 1, to: 11) }
    visibility { Faker::Number.between(from: 20, to: 50) }
    condition { ['Sunny', 'Rain', 'Snow', 'Partly Cloudy'].sample }
    icon { ['sunny.png', 'rain.png', 'snow.png', 'partly-cloudy.png'].sample }

    initialize_with { new(attributes) }
  end

  factory :daily_weather do
    skip_create

    date { (current_date).strftime('%Y-%m-%d %H:%M') }
    sunrise { '07:15 AM' }
    sunset { '08:15 PM' }
    max_temp { current_temperature + 15 }
    min_temp { current_temperature - 15 }
    condition { ['Sunny', 'Rain', 'Snow', 'Partly Cloudy'].sample }
    icon { ['sunny.png', 'rain.png', 'snow.png', 'partly-cloudy.png'].sample }

    initialize_with { new(attributes) }
  end

  factory :hourly_weather do
    skip_create

    current_hour = Faker::Number.between(from: 0, to: 23)

    time { "#{'%02d' % current_hour}:00" }
    temperature { Faker::Number.between(from: current_temperature - 5, to: current_temperature + 5) }
    condition { ['Sunny', 'Rain', 'Snow', 'Partly Cloudy'].sample }
    icon { ['sunny.png', 'rain.png', 'snow.png', 'partly-cloudy.png'].sample }

    initialize_with { new(attributes) }
  end

  factory :weather_forecast do
    skip_create

    current_weather do
      current_weather = create(:current_weather)
      {
        last_updated: current_weather.last_updated,
        temperature: current_weather.temperature,
        feels_like: current_weather.feels_like,
        humidity: current_weather.humidity,
        uvi: current_weather.uvi,
        visibility: current_weather.visibility,
        condition: current_weather.condition,
        icon: current_weather.icon
      }
    end

    daily_weather do
      daily_weather = create_list(:daily_weather, 5)
      daily_weather.map do |day|
        {
          date: day.date,
          sunrise: day.sunrise,
          sunset: day.sunset,
          max_temp: day.max_temp,
          min_temp: day.min_temp,
          condition: day.condition,
          icon: day.icon
        }
      end
    end

    hourly_weather do
      hourly_weather = create_list(:hourly_weather, 24)
      hourly_weather.map do |hour|
        {
          time: hour.time,
          temperature: hour.temperature,
          condition: hour.condition,
          icon: hour.icon
        }
      end
    end

    initialize_with do
      new(current_weather: current_weather,
            daily_weather: daily_weather,
           hourly_weather: hourly_weather
      )
    end
  end
end
