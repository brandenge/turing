class Paint
  attr_reader :color, :amount

  def initialize(color, amount = 0)
    @color = color
    @amount = amount
    sleep(2)
  end
end
