class Unicorn
  attr_reader :name, :color

  def initialize(name, color = 'silver')
    @name, @color = name, color
  end

  def silver?
    @color == 'silver'
  end

  def say(saying)
    "**;* #{saying} **;*"
  end
end
