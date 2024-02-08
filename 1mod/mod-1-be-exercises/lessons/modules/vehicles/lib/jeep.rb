require './lib/vehicle'

class Jeep
  include Vehicle

  def drive
    "All wheels go!"
  end
end
