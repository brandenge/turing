# What does an error look like when using Class Methods?
require 'pry'

class Dog
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def bark
    puts "#{@name} says, 'bark'."
  end

  def self.bark
    #binding.pry ## Can we access @name from this class method? What will output next?
    puts "#{@name} says, 'bark'."
  end

end

fluffy = Dog.new("Fluffy")
fluffy.bark
# => "Fluffy says, 'bark'."

## Uncomment each line of code, one at a time. What is the difference between teh two errors?
## What specific data type is each error on - are they instances or classes?

#fluffy.woof
# => undefined method "woof" for #<Dog:0x00....> (NoMethodError)

#Dog.woof
# => undefined method "woof" for Dog:Class