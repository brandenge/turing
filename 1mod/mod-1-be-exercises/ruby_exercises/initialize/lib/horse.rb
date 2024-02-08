class Horse
  attr_reader :name, :diet

  def initialize(name)
    @name, @diet = name, []
  end

  def add_to_diet(food)
    @diet << food
  end
end
