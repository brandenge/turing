class Monkey
  attr_reader :name, :type, :favorite_food

  def initialize((name, type, favorite_food))
    @name, @type, @favorite_food = name, type, favorite_food
  end
end
