require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class CellTest < Minitest::Test
  def setup
    @cell_1 = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell_2 = Cell.new("C3")
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_it_initializes
    assert_equal "B4", @cell_1.coordinate
  end

  def test_ship_returns_nil
    assert_equal nil, @cell_1.ship
  end

  def test_cell_is_initially_empty
    assert_equal true, @cell_1.empty?
  end

  def test_place_ship
    assert_equal true, @cell_1.empty?
    @cell_1.place_ship(@cruiser)
    assert_equal @cruiser, @cell_1.ship
    assert_equal false, @cell_1.empty?
  end

  def test_fire_upon
    assert_equal false, @cell_1.fired_upon?

    @cell_1.fire_upon
    assert_equal true, @cell_1.fired_upon?
    @cell_1.place_ship(@cruiser)
    assert_equal 3, @cell_1.ship.health

    @cell_1.fire_upon
    assert_equal 2, @cell_1.ship.health
    assert_equal true, @cell_1.fired_upon?

    @cell_1.fire_upon
    assert_equal 1, @cell_1.ship.health
    assert_equal true, @cell_1.fired_upon?
  end

  def test_render_M_after_fire_upon
    assert_equal ".", @cell_1.render
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
  end

  def test_cell_2_render
    @cell_2.place_ship(@cruiser)
    assert_equal ".", @cell_2.render
    assert_equal "S", @cell_2.render(true)

    @cell_2.fire_upon
    assert_equal "H", @cell_2.render
    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    @cruiser.hit
    assert_equal true, @cruiser.sunk?
    assert_equal "X", @cell_2.render
  end
end
