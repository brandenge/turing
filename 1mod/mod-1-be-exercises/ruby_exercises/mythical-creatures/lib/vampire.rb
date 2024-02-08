class Vampire
  attr_reader :name, :pet, :thirsty

  def initialize(name, pet = 'bat')
    @name, @pet = name, pet
    @thirsty = true
  end

  def drink
    @thirsty = false
  end
end
