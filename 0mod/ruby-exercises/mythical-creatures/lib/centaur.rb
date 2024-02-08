class Centaur
  attr_reader :name, :breed

  def initialize(name, breed)
    @name = name
    @breed = breed
    @shoot_count = 0
    @cranky = false
    @standing = true
    @sick = false
  end

  def shoot
    can_shoot = true
    (self.cranky? || !self.standing?) && can_shoot = false
    can_shoot &&
    (@shoot_count += 1) &&
    (@shoot_count % 3).zero? &&
    @cranky = true
    can_shoot ? 'Twang!!!' : 'NO!'
  end

  def run
    can_run = true
    self.laying? && can_run = false
    can_run &&
    (@shoot_count += 1) &&
    (@shoot_count % 3).zero? &&
    @cranky = true
    can_run ? 'Clop clop clop clop!' : 'NO!'
  end

  def cranky?
    @cranky
  end

  def standing?
    @standing
  end

  def sleep
    @standing ? 'NO!' : @cranky = false
  end

  def laying?
    !@standing
  end

  def lay_down
    @standing = false
  end

  def stand_up
    @standing = true
  end

  def drink_potion
    !@cranky && @sick = true
    @standing ? @cranky = false : 'NO!'
  end

  def sick?
    @sick
  end
end
