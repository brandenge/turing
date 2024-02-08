class Catalog
  def initialize
    @products = []
  end

  def cheapest
    @products.sort{ |a, b| a.price <=> b.price }.first&.name
  end

  def <<(product)
    @products << product
  end
end
