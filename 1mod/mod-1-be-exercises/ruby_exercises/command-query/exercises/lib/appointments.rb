class Appointments
  def initialize
    @appointments = []
  end

  def earliest
    @appointments.sort.first
  end

  def at(appointment)
    @appointments << appointment
  end
end
