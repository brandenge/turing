class HourlyWeather
  attr_reader :time,
              :temperature,
              :condition,
              :icon

  def initialize(data)
    @time = data[:time]
    @temperature = data[:temperature]
    @condition = data[:condition]
    @icon = data[:icon]
  end
end
