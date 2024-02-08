class Player
  attr_reader :name,
              :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def move
    puts "#{name}, please make your move in the form of <from column> <from row> <to column> <to row>:"
    gets.chomp.downcase
  end
end
