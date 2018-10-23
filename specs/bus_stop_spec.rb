require('minitest/autorun')
require('minitest/rg')
require_relative('../bus')
require_relative('../person')
require_relative('../bus_stop')

class BusStopTest < MiniTest::Test

  def setup
    @bus_stop1 = BusStop.new("Eyre Place")
    @person3 = Person.new("Fred", 5)
  end


  def test_bus_stop_has_name
    assert_equal("Eyre Place", @bus_stop1.stop_name)
  end

  def test_add_person_to_queue
    @bus_stop1.add_person(@person3)
    assert_equal(1, @bus_stop1.queue.length)
  end

end
