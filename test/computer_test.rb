require 'minitest/autorun'
require 'minitest/pride'
require 'minitest'
require './lib/computer'
require './lib/board'
require './lib/ship'

class ComputerTest < Minitest::Test

  def setup

    @board = Board.new
    @computer = Computer.new(@board)
    @computer_ship = Ship.new("Cruiser", 3)
  end
  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_initializes
  end

  def test_it_can_place_ships
  end

  def test_it_can_generate_a_random_coordinate
    three_items = ["A1", "A2", "A3"]
    assert_equal three_items.length, @computer.random_computer_placement(@computer_ship).length

    assert_equal true, @board.valid_placement?(@computer_ship, @computer.random_computer_placement(@computer_ship))
    # assert_equal true, @board.valid_placement?(@computer_ship, generated_array)
    # assert_equal true, @board.valid_coordinate?(___ )
  end
end
