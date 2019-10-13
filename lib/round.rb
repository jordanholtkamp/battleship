class Round
  def initialize
    self.start_menu_message
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
    
    #place player ships
  end
end
