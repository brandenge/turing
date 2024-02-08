class Apartment
  attr_reader :rooms

  def initialize
    @rented = false
    @rooms = []
  end

  def is_rented?
    @rented
  end

  def rent
    @rented = true
  end

  def add_room(room)
    return if @rooms.count == 4
    @rooms << room
  end

  def list_rooms_by_name_alphabetically
    @rooms.sort_by { |room| room.name }
  end
end
