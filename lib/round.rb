require_relative './turn'
class Round

  def initialize(round_array_objs)
    @computer_board = round_array_objs[0]
    @player_board = round_array_objs[1]
    @computer = round_array_objs[2]
    @player = round_array_objs[3]
    @computer_cruiser = round_array_objs[4]
    @computer_sub = round_array_objs[5]
    @player_cruiser = round_array_objs[6]
    @player_sub = round_array_objs[7]
  end

  def menu_loop
    puts "Welcome to BATTLESHIP"
    puts "Enter P to Play.  Enter Q to quit"
    user_menu_select = gets.chomp
      if user_menu_select.downcase == "p"
        start_game = "y"
      elsif user_menu_select.downcase == "q"
        p "Sorry - you are missing out.  Dummy :)"
        start_game = "stop"
      else
        puts "Plese select only P or Q"
        start_game = "n"
      end
  end

  def take_turn
    turn = Turn.new(@player_board, @computer_board)
    turn.display_boards
    turn.user_shot
    turn.display_boards
    turn.computer_shot
    turn.display_boards
    turn.display_results
  end

  def setup_computer_placement
    computer_coords_sub = @computer.random_computer_placement(@computer_sub)
    @computer_board.place(@computer_sub, computer_coords_sub)

    computer_coords_cruiser = @computer.random_computer_placement(@computer_cruiser)
    @computer_board.place(@computer_cruiser, computer_coords_cruiser)
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
      puts "\e[H\e[2J"
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

  def validate_user_input(ship_obj, user_ship_answer)
    check_user_coord(user_ship_answer) && @player_board.valid_placement?(ship_obj, user_ship_answer)
  end

  def game_over?(board)
    cells_with_ships = board.cells.values.find_all do |cell|
        cell.ship != nil
      end

    booleans_array = cells_with_ships.map do |cell|
      cell.ship.sunk?
    end
    booleans_array.all? == true
  end

  def stop_the_game(winner)
    p "#{winner} won."
  end

end
