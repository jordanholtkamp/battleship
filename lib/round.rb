require './lib/computer'
require './lib/board'
require './lib/ship'
class Round

  def initialize
    @board = Board.new
    @computer = Computer.new(@board)

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
    #find rand_computer coordinates
     binding.pry
    computer_coords_sub = @computer.random_computer_placement(@computer_sub)
    @board.place(@computer_sub, computer_coords_sub)

    computer_coords_cruiser = @computer.random_computer_placement(@computer_cruiser)
    @board.place(@computer_cruiser, computer_coords_cruiser)
  end

  def setup_user_placement
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is #{@computer_cruiser.length} units long"
    p "and the Submarine is #{@computer_sub.length} units long."

    puts @board.render_board

    puts "Enter the squares for the Cruiser (3 spaces):"
    user_cruiser = gets.chomp.split

    until @board.valid_coordinate?(user_cruiser) && @board.valid_placement?(@player_cruiser, user_cruiser)  do
      puts "Please enter a valid coordinate in this format: A1 A2 A3 within board dimensions"
      puts "Enter the squares for the Cruiser (3 spaces):"
      user_cruiser = gets.chomp.split
    end
  end

  def start_game
    setup_computer_placement
    setup_user_placement
  end
end
