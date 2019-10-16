require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'


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
    some_ship = Ship.new("the kills", 3)
    assert_equal "the kills", some_ship.name
  end

  def test_it_has_a_length_value
    assert_equal 3, @cruiser.length
  end

  def test_initial_health
    assert_equal 3, @cruiser.health
  end

  def test_hit_decreases_health_by_1
    @cruiser.hit
    assert_equal 2, @cruiser.health
  end

  def test_cruiser_sinks_after_3_hits
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
  end

end
