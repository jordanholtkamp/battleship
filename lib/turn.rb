class Turn
  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
  end

  def display_boards
    puts "================COMPUTER BOARD================"
    puts @computer_board.render_board # need to change back
    puts "================PLAYER BOARD================"
    puts @player_board.render_board(true)
  end

  def receive_user_fire_coord
    puts "Enter the coordinate for your shot: "
    user_cell_fire = gets.chomp
    until @computer_board.valid_coordinate?(user_cell_fire) && @computer_board.cells[user_cell_fire].fired_upon? == false
      p "Enter a valid coordinate you have not yet fired on:"
      user_cell_fire = gets.chomp
    end

    @computer_board.cells[user_cell_fire].fire_upon
  end

  def computer_shot
    computer_cell_fire = Array.new
    computer_fire_string = String.new
    until @player_board.valid_coordinate?(computer_fire_string) && @player_board.cells[computer_fire_string].fired_upon? == false
      computer_cell_fire = (@player_board.cells.keys.sample(1))
      computer_fire_string = computer_cell_fire[0]
    end

    @player_board.cells[computer_fire_string].fire_upon
  end

end