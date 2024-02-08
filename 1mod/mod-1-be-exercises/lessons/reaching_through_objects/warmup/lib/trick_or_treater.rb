require './bag'

class TrickOrTreater
  attr_reader :dressed_up_as
  attr_accessor :bag

  def initialize(costume)
    @costume = costume
    @dressed_up_as = costume.style
    @bag = Bag.new
  end

  def has_candy?
    !@bag.empty?
  end

  def candy_count
    @bag.count
  end

  def eat
    @bag.candies.pop
  end
end
