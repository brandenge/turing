class Children
  def initialize
    @children = []
  end

  def eldest
    @children.sort_by{ |child| child.age }.last
  end

  def <<(child)
    @children << child
  end
end
