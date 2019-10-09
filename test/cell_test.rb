require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class CellTest < Minitest::Test
  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_it_initializes
    assert_equal "B4", @cell.coordinate
  end

  def test_ship_returns_nil
    assert_equal nil, @cell.ship
  end

  def test_cell_is_initially_empty
    assert_equal true, @cell.empty?
  end

  def test_place_ship
    assert_equal true, @cell.empty?
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end

  def test_fire_upon
    @cell.place_ship(@cruiser)
    assert_equal 3, @cell.ship.health
    assert_equal false, @cell.fired_upon?

    @cell.fire_upon
    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?

    @cell.fire_upon
    assert_equal 1, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end

  def test_render_M_after_fire_upon
    cell_1 = Cell.new("B4")
    # cell_1.place_ship(@cruiser)

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end
end
