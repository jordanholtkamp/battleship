require_relative './board'
require_relative './round'
require_relative './computer'
require_relative './ship'

@computer_board = Board.new
@player_board = Board.new

@computer = Computer.new(@computer_board)

@computer_cruiser = Ship.new("Cruiser", 3)
@computer_sub = Ship.new("Submarine", 2)

@player_cruiser = Ship.new("Cruiser", 3)
@player_sub = Ship.new("Submarine", 2)

round_array_objs = [@computer_board, @player_board, @computer, @player, @computer_cruiser, @computer_sub, @player_cruiser, @player_sub]

@round = Round.new(round_array_objs)

while @round.menu_loop == "n"
  @round.menu_loop
  break if @round.menu_loop == "stop"
end

@round.setup_computer_placement
@round.setup_user_placement

until @round.game_over?(@player_board) || @round.game_over?(@computer_board)
    @round.take_turn
    sleep(3)
  end

if @round.game_over?(@player_board)
  @round.stop_the_game("I")
elsif @round.game_over?(@computer_board)
  @round.stop_the_game("You")
end

