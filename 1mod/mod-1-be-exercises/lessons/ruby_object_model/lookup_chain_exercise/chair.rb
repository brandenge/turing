require "./chair_module"
require "./furniture"

class Chair < Furniture
  include ChairModule

  def initialize
    @motto = "I'm a chair!"
  end

  def chair_type
    short = "variable"
    puts short
    puts soft
  end

  def short
    "method"
  end

  def soft
    "class"
  end

end

require 'pry-byebug'; require 'pry'; binding.pry;

Chair.new.chair_type
