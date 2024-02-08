require_relative "lib/rectangle"
require_relative "lib/shape"
require "pry"

r = Rectangle.new("blue", 5, 10)
puts r.area
puts r.perimeter

s = Shape.new("red", 2, 4)
puts s.area
puts s.perimeter

# binding.pry

# TODO:
# 1. Make the Rectangle class pass its tests.
# 2. Refactor Rectangle to inherit from Shape, without changing any tests.
# 3. Re-run the Rectangle test to determine if the refactor was successful. If the tests still pass, then inheritance is working!

# Reflection Questions

# 1. Why are we using inheritance here?
# 2. What class is r?
# 3. Does Rectangle have a superclass?
# 4. What ancestors does Rectangle have?
# 5. Think about what would happen if we built a Square class. Would inheritance still apply?


#### PART 2 - See runner.rb ####
# Uncomment below to continue with Circle.

# c = Circle.new("green", 5)
# puts c.circumference # => 31.41593
# binding.pry