class RollCall
  def initialize
    @names = []
  end

  def longest_name
    @names.sort_by{ |name| name.length }.last
  end

  def <<(name)
    @names << name
  end
end
