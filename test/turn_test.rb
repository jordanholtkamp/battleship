# require 'minitest'
# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/turn'
# require './lib/board'
#
# class TurnTest < Minitest::Test
#
#   def setup
#     @round = Round.new
#     @player_board = Board.new
#     @computer_board = Board.new
#     @turn = Turn.new(@player_board, @computer_board)
#   end
#
#   def test_it_exists
#     assert_instance_of Turn, @turn
#   end
#
#   def test_it_decrements_user_cell_fire_health
#     @round.take_turn
#
#     # assert_equal @computer.
#   end
# end