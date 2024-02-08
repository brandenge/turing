class Clock
  def initialize
    @time = 6
  end

  def time
    @time %= 12
  end

  def wait
    @time += 1
  end
end
