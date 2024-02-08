require_relative 'card'

class CardGenerator
  attr_reader :cards

  def initialize(filename)
    file = IO.readlines(filename, chomp: true)
    @cards = file.map{ |card| Card.new(*card.split(','))}
  end
end
