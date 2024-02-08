class Werewolf
  attr_reader :name, :location

  def initialize(name, location = '')
    @name, @location = name, location
    @human = false
    @hungry = false
  end

  def human?
    !@human
  end

  def wolf?
    @human
  end

  def change!
    @hungry = true
    @human = !@human
  end

  def hungry?
    @hungry
  end

  def consume(victim)
    !self.human? &&
    ((@hungry = false) ||
    (victim.status = :dead))
  end
end
