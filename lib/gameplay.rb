class Gameplay

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
  end

  def welcome_screen
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
    play_or_quit
  end

  def play_or_quit
    input = gets.chomp
    if input == "q"
      sleep(0.5)
      puts "Goodbye"
      sleep(2.0)
      self.play_or_quit
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
        self.play_or_quit
      end
    end
  end


  def computer_place_ships
    cruiser_coordinates = []
    until cruiser_coordinates.count == 3 && @computer_board.valid_placement?(@computer_cruiser, cruiser_coordinates) do
      sample = @computer_board.cells.keys.sample
      cruiser_coordinates << sample
    end
    @computer_board.place(@computer_cruiser, cruiser_coordinates)

    sub_coordinates = []
    until sub_coordinates.count == 2 && @computer_board.valid_placement?(@computer_sub, sub_coordinates) do
      sample = @computer_board.cells.keys.sample
      sub_coordinates << sample
    end
    @computer_board.place(@computer_sub, sub_coordinates)
  end

  def user_place_ships
    puts "Enter the squares for the Cruiser (3 spaces)."
    user_spaces = gets.chomp
    spaces = []
    spaces << user_spaces
    if @player_board.valid_placement?(@player_cruiser, spaces)
      @player_board.place(@player_cruiser, spaces)
      puts @player_board.render_board(peek = true) + "(\n)" + "Enter the squares for the Submarine (2 spaces)."
    end
    user_spaces = gets.chomp
    spaces = []
    spaces << user_spaces
    if @player_board.valid_placement?(@player_sub, spaces)
      @player_board.place(@player_sub, spaces)
      puts @player_board.render_board(peek = true) + "(\n)" + "You have placed both your ships!"
    end
  end

end