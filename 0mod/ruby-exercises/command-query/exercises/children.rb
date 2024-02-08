class Children
  def initialize
    @children = []
  end

  def eldest
    @children.sort{ |a, b| a.age <=> b.age }.last
  end

  def <<(child)
    @children << child
  end
end
