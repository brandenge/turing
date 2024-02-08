class Rabbit
  attr_reader :name

  def initialize(**rabbit)
    @num_syllables = rabbit[:num_syllables]
    @name = rabbit[:name] + (@num_syllables == 2 ? " Rabbit" : "")
  end
end
