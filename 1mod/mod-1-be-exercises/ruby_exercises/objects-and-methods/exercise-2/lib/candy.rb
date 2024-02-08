class Candy
  attr_reader :type, :sugar
  def initialize(candy, sugar = 100)
    @type = candy
    @sugar = sugar
  end
end
