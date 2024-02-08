class Street
  attr_reader :name

  def initialize(name)
    @name = name
    @buildings = []
  end

  def buildings
    @buildings.sort_by{ |building| building.building_name }
  end

  def add_building(building)
    @buildings << building
  end

  def number_of_available_apartments
    @buildings.map { |building| building.list_apartments }
      .flatten.filter { |apartment| !apartment.is_rented? }.count
  end
end
