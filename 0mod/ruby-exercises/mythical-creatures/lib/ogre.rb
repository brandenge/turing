class Ogre
  attr_reader :name, :home
  attr_accessor :swings

  def initialize(name, home = 'Swamp')
    @name, @home = name, home
    @swings = 0
  end

  def encounter(human)
    human.encounter_counter += 1
    human.notices_ogre? && swing_at(human)
  end

  def swing_at(human)
    @swings += 1
    human.swung_at += 1
    !human.swung_at.zero? &&
    (human.swung_at % 2).zero? &&
    (human.knocked_out = true)
  end

  def apologize(human)
    human.knocked_out = false
    human.swung_at = 0
  end
end

class Human
  attr_reader :name
  attr_writer :knocked_out
  attr_accessor :encounter_counter, :swung_at

  def initialize(name = 'Jane')
    @name = name
    @encounter_counter = 0
    @swung_at = 0
    @knocked_out = false
  end

  def notices_ogre?
    !@encounter_counter.zero? && (@encounter_counter % 3).zero?
  end

  def knocked_out?
    @knocked_out
  end
end
