class Narwhal
  attr_reader :name, :weight

  def initialize(**animal)
    @name, @weight, @cute = animal[:name], animal[:weight], animal[:cute]
  end

  def cute?
    @cute
  end
end
