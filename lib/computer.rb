require 'pry'
class Computer

  def initialize(board)
    @board = board
  end

  def random_computer_placement(ship)
    computer_coord = ["A0", "A0", "A0"]
    until @board.valid_placement?(ship, computer_coord) == true do
       computer_coord = (@board.cells.keys.sample(3))
    end
    computer_coord
    # compu_rand = ""

    # # compu_rand << rand a.ord..d.ord
    # compu_rand += (rand 65..68).chr
    # compu_rand += (rand 1..4).to_s
    # binding.binding.pry
    # puts compu_rand
    # do while
    # # generate a random coord
    # # "A1, A4, C5" [A1].board.valid_placement
    # # "a1, A2, A3"

  end
end
