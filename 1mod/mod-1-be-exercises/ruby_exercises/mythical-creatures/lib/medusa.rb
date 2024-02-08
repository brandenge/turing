class Medusa
  attr_reader :name, :statues

  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    unstoned = nil
    (@statues.length == 3) &&
    (unstoned = @statues.shift) &&
    unstoned.stoned = false
    @statues << victim
    victim.stoned = true
  end

  private

  def victim_count
    @statues.length
  end
end

class Person
  attr_reader :name
  attr_writer :stoned

  def initialize(name)
    @name = name
    @stoned = false
  end

  def stoned?
    @stoned
  end
end
