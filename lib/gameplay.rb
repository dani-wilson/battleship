class Gameplay

  def initialize
  end

  def start_or_quit
    puts "     |__
    |\/
    ---
    / | [
!      | |||
_/|     _/|-++'
+  +--|    |--|--|_ |-
{ /|__|  |/\__|  |--- |||__/
+---------------___[}-_===_.'____                 /\
____`-' ||___-{]_| _[}-  |     |_[___\==--            \/   _
__..._____--==/___]_|__|_____________________________[___\==--____,------' .7
|                                                                     BB-61/
\_________________________________________________________________________|"
    # sleep(2.0)
    puts "Welcome to BATTLESHIP"
    sleep(1.0)
    puts "Enter p to play. Enter q to quit."
    game_options
  end

  def game_options
    input = gets.chomp
    if input == "q"
      sleep(0.5)
      puts "Goodbye"
      sleep(2.0)
      self.start_or_quit
    elsif input == "p"
      computer_place_ships
      puts "I have laid out my ships on the grid."
      sleep(1.5)
      puts "You now need to lay out your two ships."
      sleep(1.5)
      puts "The Cruiser is three units long and the Submarine is two units long."
      sleep(1.5)
      board = Board.new
      puts board.render_board
      user_place_ships
    else
      puts "Invalid input, please enter p or q."
      until input == "p" || input == "q"
        self.game_options
      end
    end
  end


  def computer_place_ships

  end

  def user_place_ships
    puts "Enter the squares for the Cruiser (3 spaces)."
    user_spaces = gets.chomp
    spaces = []
    spaces >> user_spaces
    if spaces.board.valid_placement
      puts board.render_board(peek = true) + "(\n)" + "Enter the squares for the Submarine (2 spaces)."
    end
  end
end