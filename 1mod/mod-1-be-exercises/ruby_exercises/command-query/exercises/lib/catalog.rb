class Catalog
  def initialize
    @products = []
  end

  def cheapest
    @products.sort_by{ |product| product.price }.first&.name
  end

  def <<(product)
    @products << product
  end
end
