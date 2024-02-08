class Painter

  attr_reader :name

  def initialize(name)
    @name = name
    @paints = []
  end

  def greeting
    "Hello, I'm #{name}"
  end

  def get_paints
    @paints
  end

  def add_all_paints
    @paints << paint_1
    @paints << paint_2
  end

  def add_paint(paint)
    @paints << paint
  end

  def paint_names
    get_paints.map do |paint|
      @color
    end
  end
end
