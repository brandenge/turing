class Baby
  def initialize
    @rested = false
  end

  def tired?
    !@rested
  end

  def nap
    @rested = true
  end
end
