class AutomaticTellerMachine
  attr_reader :id,
              :name,
              :address,
              :lat,
              :lon,
              :distance

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @address = data[:address]
    @lat = data[:lat]
    @lon = data[:lon]
    @distance = data[:distance]
  end
end
