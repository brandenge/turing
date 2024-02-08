class Dog
  def initialize(name, breed)
    @name, @breed = name, breed
  end

  def greeting
    "Woof, I'm #{@name} the #{@breed}!"
  end
end
