require('minitest/autorun')
require('minitest/rg')
require_relative('../person')

class PersonTest < MiniTest::Test

  def setup
    @person1 = Person.new("Amy", 33)
  end

  def test_person_has_name
    expected = "Amy"
    actual = @person1.name
    assert_equal(expected, actual)

  end

end
