class Bob
  attr_reader :paints

  def initialize
    @paints = []
  end

  def add_paint(paint)
    @paints << paint
  end

  def paint_colors
    @paints.map do |paint|
      paint.color
    end
  end

  def total_paint_amount
    total = 0
    @paints.each do |paint|
      total += paint.amount
    end
    total
  end
end
