class TrickOrTreater
  attr_reader :bag

  def initialize(costume)
    @costume = costume
    @dressed_up_as = costume
    @bag = []
  end

  def dressed_up_as
    @costume.style
  end

  def has_candy?
    !@bag.empty?
  end

  def candy_count
    @bag.count
  end

  def eat
    @bag.pop
  end
end
