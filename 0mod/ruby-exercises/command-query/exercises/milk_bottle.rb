class MilkBottle
  def initialize
    @full = true
  end

  def full?
    @full
  end

  def spill
    @full = false
  end
end
