class Adult
  def initialize
    @drinks = 0
  end

  def sober?
    @drinks < 3
  end

  def consume_an_alcoholic_beverage
    @drinks += 1
  end
end
