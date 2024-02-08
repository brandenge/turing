class Pills
  attr_reader :count

  def initialize
    @count = 60
  end

  def pop
    @count -= 1
  end
end
