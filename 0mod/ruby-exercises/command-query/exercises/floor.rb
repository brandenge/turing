class Floor
  def initialize
    @clean = false
  end

  def dirty?
    !@clean
  end

  def wash
    @clean = true
  end
end
