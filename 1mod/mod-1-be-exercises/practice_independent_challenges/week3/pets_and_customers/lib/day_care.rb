class DayCare
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def customer_by_id(id)
    @customers.find do |customer|
      customer.id == id
    end
  end

  def unfed_pets
    pets = @customers.map do |customer|
      customer.pets
    end.flatten
    pets.find_all do |pet|
      !pet.fed?
    end
  end
end
