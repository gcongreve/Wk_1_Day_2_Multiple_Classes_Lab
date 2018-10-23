require('minitest/autorun')
require('minitest/rg')
require_relative('../bus')
require_relative('../person')

class BusTest < MiniTest::Test

  def setup()
    @bus1 = Bus.new(22, "Ocean Terminal")
    @person2 = Person.new("Mike", 50)
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

end
