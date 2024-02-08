class Direwolf
  attr_reader :name, :home, :size, :starks_to_protect

  def initialize(name, home = 'Beyond the Wall', size = 'Massive')
    @name, @home, @size = name, home, size
    @starks_to_protect = []
    @hunts_white_walkers = true
  end

  def protects(stark)
    stark.location == @home &&
    (@starks_to_protect.length < 2) &&
    (@starks_to_protect << stark) &&
    (stark.safe = true) &&
    (@hunts_white_walkers = false) ||
    stark
  end

  def hunts_white_walkers?
    @hunts_white_walkers
  end

  def leaves(stark)
    @starks_to_protect.delete(stark) &&
    (stark.safe = false) ||
    @hunts_white_walkers = true &&
    stark
  end
end

class Stark
  attr_reader :name, :location, :house_words
  attr_writer :safe

  def initialize(name, location = 'Winterfell')
    @name, @location = name, location
    @safe = false
    @house_words = 'Winter is Coming'
  end

  def safe?
    @safe
  end
end
