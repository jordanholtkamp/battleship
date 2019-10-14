require './lib/computer'
require './lib/board'
require './lib/ship'
class Round

  def initialize
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
        #create board
        setup_game
      elsif user_menu_select.downcase == "q"
      else
        puts "Plese select only P or Q"
        start_menu_message
      end
  end

  def setup_game
    #place computer ships
    @board = Board.new
    @computer = Computer.new(@board)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)

    #find rand_computer coordinates
    computer_coords_sub = @computer.random_computer_placement(@computer_sub)
    computer_coords_cruiser = @computer.random_computer_placement(@computer_cruiser)

    #place computer ship
    @board.place(@computer_sub, computer_coords_sub)


    @board.place(@computer_cruiser, computer_coords_cruiser)


    #place player ships
  end
end
