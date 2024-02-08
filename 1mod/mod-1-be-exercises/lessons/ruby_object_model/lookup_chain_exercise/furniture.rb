require "./wood_things"
require './furniture_module'

class Furniture < WoodThings
  include FurnitureModule

  def self.test
    puts 'The test class method is inherited'
  end

  def soft
    "superclass"
  end

end
