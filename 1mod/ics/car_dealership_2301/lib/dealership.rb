class Dealership
  attr_reader :inventory

  def initialize(name, address)
    @name = name
    @address = address
    @inventory = []
  end

  def inventory_count
    @inventory.count
  end

  def add_car(car)
    @inventory << car
  end

  def has_inventory?
    @inventory.count > 0
  end

  def cars_by_make(make)
    @inventory.filter{ |car| car.make == make }
  end

  def total_value
    @inventory.sum{ |car| car.total_cost }
  end

  def details
    {
      'total_value' => total_value,
      'address' => @address
    }
  end

  def average_price_of_car
    details['total_value'].fdiv(inventory_count).round.to_s
    .gsub(/\B(?=(\d{3})*\b)/, ',')
  end

  def cars_sorted_by_price
    @inventory.sort_by{ |car| car.total_cost }
  end

  def inventory_hash
    @inventory.group_by{ |car| car.make }
  end
end
