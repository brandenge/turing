module WeatherActivitiesFixture
  ATTRIBUTES = {
    data: {
      id: 'null',
      type: 'activities',
      attributes: {
        destination: 'chicago,il',
        forecast: {
          summary: 'Cloudy with a chance of meatballs',
          temperature: '45 F'
        },
        activities: {
          'Learn a new recipe': {
            type: 'cooking',
            participants: 1,
            price: 0
          },
          'Take a bubble bath': {
            type: 'relaxation',
            participants: 1,
            price: 0.5
          }
        }
      }
    }
  }
end
