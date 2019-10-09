require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_initializes
    assert_equal Hash, @board.cells.class
  end

  def test_hash_contents
    assert_equal 16, @board.cells.length
    # @board.cells.each do |key, value|
      #our test here...
      #should we test like this
    # end
  end
end