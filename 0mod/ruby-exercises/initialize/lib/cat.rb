class Cat
  attr_reader :name, :sound

  def initialize(name)
    @name, @sound = name, "meow"
  end
end
