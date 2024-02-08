class Tire
  def initialize
    @flat_tire = false
  end

  def flat?
    @flat_tire
  end

  def blow_out
    @flat_tire = true
  end
end
