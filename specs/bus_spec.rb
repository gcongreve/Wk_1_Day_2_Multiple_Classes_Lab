require('minitest/autorun')
require('minitest/rg')
require_relative('../bus')
require_relative('../person')
require_relative('../bus_stop')

class BusTest < MiniTest::Test

  def setup()
    @bus1 = Bus.new(22, "Ocean Terminal")

    @person2 = Person.new("Mike", 50)
    @person3 = Person.new("Dave", 50)
    @person4 = Person.new("Phil", 50)
    @people = [@person2, @person3, @person4]

    @bus_stop1 = BusStop.new("Leith Walk")
  end

  def test_bus_has_number
    expected = 22
    actual = @bus1.number
    assert_equal(expected, actual)
  end

  def test_bus_can_drive
    expected = "brum brum"
    actual = @bus1.drive
    assert_equal(expected, actual)
  end

  def test_bus_has_passenger_array
    expected = []
    actual = @bus1.passengers
    assert_equal(expected, actual)
  end

  def test_number_of_passengers
    expected = 0
    actual = @bus1.find_passengers
    assert_equal(expected, actual)
  end

  def test_passenger_picked_up
    expected = 1
    @bus1.pick_up(@person2)
    actual = @bus1.passengers.length
    assert_equal(expected, actual)
  end

  def test_passenger_drop_off
    assert_equal(0, @bus1.find_passengers)
    @bus1.pick_up(@person2)
    assert_equal(1, @bus1.find_passengers)
    @bus1.drop_off(@person2)
    assert_equal(0, @bus1.find_passengers)
  end

  def test_empty_the_bus
    assert_equal(0, @bus1.find_passengers)
    @bus1.pick_up(@person2)
    assert_equal(1, @bus1.find_passengers)
    @bus1.empty_bus
    assert_equal(0, @bus1.find_passengers)
  end

  def test_pick_up_from_bus_stop
    @bus_stop1.add_people(@people)
    @bus1.pick_up_from_stop(@bus_stop1)
    assert_equal(3, @bus1.find_passengers)
  end

end
