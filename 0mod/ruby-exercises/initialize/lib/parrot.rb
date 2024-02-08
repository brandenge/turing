class Parrot
  attr_reader :name, :sound, :known_words

  def initialize(**parrot)
    @name, @sound, @known_words = parrot[:name], "Squawk!", parrot[:known_words]
  end
end
