class Clearance
  def initialize
    @items = []
  end

  def best_deal
    @items.sort{ |a, b| a.discount.fdiv(a.price) <=> b.discount.fdiv(b.price) }.last&.name
  end

  def <<(item)
    @items << item
  end
end
