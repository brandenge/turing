class Building
  attr_reader :building_number,
              :building_name,
              :list_apartments

  def initialize(number, name)
    @building_number = number
    @building_name = name
    @list_apartments = []
  end

  def add_apartment(apartment)
    return if @list_apartments.count == 4
    @list_apartments << apartment
  end
end
