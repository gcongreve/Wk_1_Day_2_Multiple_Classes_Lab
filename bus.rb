class Bus

  attr_reader :number, :route, :passengers

  def initialize(number, route)
    @number = number
    @route = route
    @passengers = []
  end

  def drive
    return "brum brum"
  end

  def find_passengers
    return @passengers.length
  end

  def pick_up(passenger)
    @passengers << passenger
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def empty_bus
    @passengers = []
  end

end
