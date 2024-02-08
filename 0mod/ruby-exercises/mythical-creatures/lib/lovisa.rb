class Lovisa
  attr_reader :title, :characteristics

  def initialize(title, characteristics = ['brilliant'])
    @title, @characteristics = title, characteristics
  end

  def brilliant?
    @characteristics.include?('brilliant')
  end

  def kind?
    @characteristics.include?('kind')
  end

  def say(saying)
    "**;* #{saying} **;*"
  end
end
