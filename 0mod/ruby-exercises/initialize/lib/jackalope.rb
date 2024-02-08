class Jackalope
  attr_reader :name, :etymology

  def initialize(name)
    @name, @etymology = name, ["Jackrabbit", "Antelope"]
  end
end
