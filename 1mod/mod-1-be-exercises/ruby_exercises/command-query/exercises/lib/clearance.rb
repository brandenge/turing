class Clearance
  def initialize
    @items = []
  end

  def best_deal
    @items.sort_by{ |item| item.discount.fdiv(item.price) }.last&.name
  end

  def <<(item)
    @items << item
  end
end
