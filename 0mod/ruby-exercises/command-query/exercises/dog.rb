class Dog

  def initialize
    @fed = false
  end

  def hungry?
    !@fed
  end

  def eat
    @fed = true
  end
end
