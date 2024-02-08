class Lion
  attr_reader :name, :sound

  def initialize(**animal)
    @name, @sound = animal[:name], animal[:sound]
  end
end
