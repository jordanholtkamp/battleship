require 'pry'
class Computer

  def initialize(board)
    @board = board
  end

  def random_computer_placement(ship)
    computer_coord = []
    until @board.valid_placement?(ship, computer_coord) == true do
       computer_coord = (@board.cells.keys.sample(ship.length))
    end
    computer_coord
  end
end
