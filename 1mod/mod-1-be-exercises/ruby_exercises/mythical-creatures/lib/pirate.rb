class Pirate
  attr_reader :name, :job, :booty

  def initialize(name, job = 'Scallywag')
    @name, @job = name, job
    @heinous_act_count = 0
    @booty = 0
  end

  def commit_heinous_act
    @heinous_act_count += 1
  end

  def cursed?
    @heinous_act_count > 2
  end

  def rob
    @booty += 100
  end
end
