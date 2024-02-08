class Cupcakes
  def initialize
    @cupcakes = []
  end

  def sweetest
    @cupcakes.sort{ |a, b| a.sugar <=> b.sugar }.last
  end

  def <<(cupcake)
    @cupcakes << cupcake
  end
end
