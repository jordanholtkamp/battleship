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
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
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
    assert_equal three_items.length, @computer.random_computer_placement(@computer_cruiser).length
    assert_equal true, @board.valid_placement?(@computer_cruiser, @computer.random_computer_placement(@computer_cruiser))

    assert_equal true, @board.valid_placement?(@computer_sub, @computer.random_computer_placement(@computer_sub))

  end
end
