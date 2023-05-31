class Gameplay
  attr_reader :player_board,
              :computer_board

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
    self.play_or_quit
  end

  def play_or_quit
    input = gets.chomp
    if input == "q"
      sleep(0.5)
      puts "Goodbye"
      sleep(2.0)
      self.welcome_screen
    elsif input == "p"
      self.board_setup
    else
      puts "Invalid input, please enter p or q."
      until input == "p" || input == "q"
        self.play_or_quit
      end
    end
  end

  def board_setup
    computer_place_ships
    puts "I have laid out my ships on the grid."
    sleep(1.5)
    puts "You now need to lay out your two ships."
    sleep(1.5)
    puts "The Cruiser is three units long and the Submarine is two units long."
    sleep(1.5)
    puts @player_board.render_board
    user_place_cruiser
  end

  def computer_place_ships
    cruiser_coordinates = []
    until @computer_board.valid_placement?(@computer_cruiser, cruiser_coordinates) do
      sample = @computer_board.cells.keys.sample(3)
      cruiser_coordinates << sample
    end
    @computer_board.place(@computer_cruiser, cruiser_coordinates)

    sub_coordinates = []
    until @computer_board.valid_placement?(@computer_sub, sub_coordinates) do
      sample = @computer_board.cells.keys.sample(2)
      sub_coordinates << sample
    end
    @computer_board.place(@computer_sub, sub_coordinates)
  end

  def user_place_cruiser
    puts "Enter the coordinates for your Cruiser.
    You may place your ships either vertically or horizontally on the board (no diagonals!)."
    sleep(1.5)
    puts "Please select your first coordinate (e.g. A1)."
    spaces = []
    coord_1 = gets.chomp
    spaces << coord_1
    puts "Please select your second coordinate."
    coord_2 = gets.chomp
    spaces << coord_2
    puts "Please select your third coordinate."
    coord_3 = gets.chomp
    spaces << coord_3
    if @player_board.valid_placement?(@player_cruiser, spaces)
      @player_board.place(@player_cruiser, spaces)
      puts @player_board.render_board(peek = true) 
      puts "Enter the coordinates for the Submarine.
      Do not overlap your ships!"
      user_place_sub
    else
      puts "Invalid placement.
      Please enter 3 separate coordinates which are consecutive and either...
      Horizontal (e.g. A1, A2, A3)
      or Vertical (e.g. A1, B1, C1)
      "
      user_place_cruiser
    end
  end

  def user_place_sub
    spaces = []
    puts "Please select your first coordinate."
    coord_1 = gets.chomp
    spaces << coord_1
    puts "Please select your second coordinate."
    coord_2 = gets.chomp
    spaces << coord_2
    if @player_board.valid_placement?(@player_sub, spaces)
      @player_board.place(@player_sub, spaces)
      puts @player_board.render_board(peek = true)
      puts "You have placed both your ships!"
      sleep(1.5)
      puts "Let's play!"
      sleep(1.0)
      display_boards
      sleep(1.5)
      user_turn
    else
      puts "Invalid placement.
        Please enter 2 separate coordinates which are consecutive and either...
        Horizontal (e.g. A1, A2)
        or Vertical (e.g. A1, B1)"
      user_place_sub
    end
  end

  def display_boards
    puts "==*============*=COMPUTER BOARD====*======*======"
    puts @computer_board.render_board(peek = false)
    puts "==========*=====*PLAYER BOARD====*============*=="
    puts @player_board.render_board(peek = true)
  end

  def user_turn
    puts "Please select a coordinate to fire upon. Choose wisely."
      shot = gets.chomp
        if @computer_board.valid_coordinate?(shot)
        @computer_board.cells[shot].fire_upon
        sleep(1.5)
        puts "Your shot on #{shot} was a #{@computer_board.cells[shot].render}"
        sleep(1.5)
        end
      display_boards
  end

end