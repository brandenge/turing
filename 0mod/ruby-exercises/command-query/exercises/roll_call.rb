class RollCall
  def initialize
    @names = []
  end

  def longest_name
    @names.sort{ |a, b| a.length <=> b.length }.last
  end

  def <<(name)
    @names << name
  end
end
