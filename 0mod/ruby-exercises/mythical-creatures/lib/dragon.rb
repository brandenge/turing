class Dragon
  attr_reader :name, :color, :rider

  def initialize(name, color, rider)
    @name, @color, @rider = name, color, rider
    @eat_count = 0
  end

  def hungry?
    @eat_count < 3
  end

  def eat
    @eat_count += 1
  end
end
