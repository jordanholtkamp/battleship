require './lib/computer'
require './lib/player'
require './lib/board'
require './lib/ship'
require './lib/turn'
class Round

  def initialize
    @computer_board = Board.new
    @player_board = Board.new

    @computer = Computer.new(@computer_board)
    @player = Player.new(@player_board)

    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)

    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)

    start_menu_message
  end

  def start_menu_message
     puts "Welcome to BATTLESHIP"
     puts "Enter P to Play.  Enter Q to quit"
     menu_loop
  end

  def menu_loop
      user_menu_select = gets.chomp

      if user_menu_select.downcase == "p"
        start_game
      elsif user_menu_select.downcase == "q"
        p "Sorry - you are missing out.  Dummy :)"
      else
        puts "Plese select only P or Q"
        start_menu_message
      end
  end

  def setup_computer_placement
    computer_coords_sub = @computer.random_computer_placement(@computer_sub)
    @computer_board.place(@computer_sub, computer_coords_sub)

    computer_coords_cruiser = @computer.random_computer_placement(@computer_cruiser)
    @computer_board.place(@computer_cruiser, computer_coords_cruiser)
  end

  def check_user_coord(user_ship)
    good_to_go = false
    user_ship.each do |coord|
      if @player_board.valid_coordinate?(coord)
        good_to_go = true
      else
        good_to_go = false
      end
    end
    good_to_go
  end

  def setup_user_placement
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is #{@computer_cruiser.length} units long"
    p "and the Submarine is #{@computer_sub.length} units long."

    puts @computer_board.render_board

    puts "Enter the squares for the Cruiser (3 spaces):"
    user_cruiser_answer= gets.chomp.split
    until validate_user_input(@player_cruiser, user_cruiser_answer) do
      puts "Please enter a valid coordinate in this format: A1 A2 A3 within board dimensions"
      puts "Enter the squares for the Cruiser (3 spaces):"
      user_cruiser_answer = gets.chomp.split
    end

    @player_board.place(@player_cruiser, user_cruiser_answer)
    puts @player_board.render_board(true)

    puts "Enter the squares for the Sub (2 spaces):"
    user_sub_answer = gets.chomp.split
    until validate_user_input(@player_sub, user_sub_answer) && (@player_board.ship_placed?(user_sub_answer) == false)
      puts "Please enter a valid coordinate in this format: A1 A2 within board dimensions"
      puts "Enter the squares for the Sub (2 spaces):"
      user_sub_answer = gets.chomp.split
    end

    @player_board.place(@player_sub, user_sub_answer)
    puts @player_board.render_board(true)
  end

  def validate_user_input(ship_obj, user_ship_answer)
    check_user_coord(user_ship_answer) && @player_board.valid_placement?(ship_obj, user_ship_answer)
  end

  def take_turn
    turn = Turn.new(@player_board, @computer_board)
    turn.display_boards
    turn.user_shot
    turn.display_boards
    turn.computer_shot
    turn.display_boards
    turn.display_results

    # turns << turn
  end

  def game_over?(board)
    cells_with_ships = board.cells.values.find_all do |cell|
        cell.ship != nil
      end

    booleans_array = cells_with_ships.map do |cell|
      cell.ship.sunk?
    end
    booleans_array.all?(true)
  end

  def stop_the_game(winner)
    p "#{winner} won."
  end

  def start_game
    setup_computer_placement
    setup_user_placement

    until game_over?(@player_board) || game_over?(@computer_board)
      take_turn
    end

    if game_over?(@player_board)
      stop_the_game("I")
    elsif game_over?(@computer_board)
      stop_the_game("You")
    end
  end
end
