class Wizard
  attr_reader :name

  def initialize(name, bearded: true)
    @name = name
    @bearded = bearded
    @rested = true
    @spell_count = 0
  end

  def bearded?
    @bearded
  end

  def incantation(command)
    "sudo #{command}"
  end

  def rested?
    @rested
  end

  def cast
    @spell_count += 1
    @spell_count > 2 && @rested = false
    "MAGIC MISSILE!"
  end
end
