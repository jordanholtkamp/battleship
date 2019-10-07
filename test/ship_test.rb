require './lib/ship'
require 'minitest/autorun'
require 'minitest/pride'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_it_has_a_name
    assert_equal "Cruiser", @cruiser.name
  end

  def test_it_can_have_a_differnt_name
    some_ship = Ship.new("the kills")
    assert_equal "the kills", some_ship.name
  end

  def test_it_has_a_length_value
    assert_equal 3, @cruiser.length
  end

end
