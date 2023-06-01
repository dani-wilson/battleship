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
    computer_place_ship(@computer_cruiser)
    computer_place_ship(@computer_sub)
    puts "I have laid out my ships on the grid."
    sleep(1.5)
    puts "You now need to lay out your two ships."
    sleep(1.5)
    puts "The Cruiser is three units long and the Submarine is two units long."
    sleep(1.5)
    puts @player_board.render_board
    user_place_cruiser
  end


  def computer_place_ship(ship)
    loop do
      coordinates = []
      ship.length.times do
        coordinates << @computer_board.cells.keys.sample
      end
      coordinates.sort
      if @computer_board.valid_placement?(ship, coordinates) == true
          @computer_board.place(ship, coordinates)
        break
      end
    end
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
      puts "Invalid placement.""\n""\n"
      puts "Please enter 3 separate coordinates which are:
      * placed starting with the upper-left most coordinate
      * consecutive
      * horizontal (e.g. A1, A2, A3) or vertical (e.g. A1, B1, C1)""\n""\n"
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
      puts "Invalid placement.""\n""\n"
      puts "Please enter 3 separate coordinates which are:
      * placed starting with the upper-left most coordinate
      * consecutive
      * horizontal (e.g. A1, A2) or vertical (e.g. A1, B1)""\n""\n"
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
    if @computer_board.valid_coordinate?(shot) && @computer_board.cells[shot].fired_upon? == false
      @computer_board.cells[shot].fire_upon
      sleep(1.5)
      puts "    _.-^^---....,,--       
      _--                  --_  
      <                        >)
      |                         | 
      \._                   _./  
          ```--. . , ; .--'''       
                | |   |             
            .-=||  | |=-.   
            `-=#$%&%$#=-'   
                | ;  :|     
      _____.,-#%&$@%#&#~,._____"
      sleep(1.5)
      explain_render(@computer_board, shot, "your")
      sleep(1.5)
    elsif
        puts "Invalid coordinates. Try again."
        user_turn
    else
      puts "This coordinate has already been fired upon.
      Please choose another."
      user_turn
    end
    display_boards
    if @computer_cruiser.sunk? == true && @computer_sub.sunk? == true
      ending_message
    else
      computer_turn
    end
  end

  def computer_turn
    puts "I will now attempt to fire on one of your ships."
    sleep(1.5)
    puts "    _.-^^---....,,--       
    _--                  --_  
   <                        >)
   |                         | 
    \._                   _./  
       ```--. . , ; .--'''       
             | |   |             
          .-=||  | |=-.   
          `-=#$%&%$#=-'   
             | ;  :|     
    _____.,-#%&$@%#&#~,._____"
    loop do
      shot = @player_board.cells.keys.sample
      if @player_board.valid_coordinate?(shot) && @player_board.cells[shot].fired_upon? == false
        @player_board.cells[shot].fire_upon
        sleep(1.5)
        explain_render(@player_board, shot, "my")
        sleep(1.5)
        break
      end
    end
    display_boards
    if @player_cruiser.sunk? == true && @player_sub.sunk? == true
      ending_message
    else
      user_turn
    end
  end

  def explain_render(board, shot, pov)
    if board.cells[shot].render == "M"
      puts "#{pov.capitalize} shot on #{shot} was a miss."
    elsif board.cells[shot].render == "H"
      puts "#{pov.capitalize} shot on #{shot} was a HIT!"
    else
      puts "#{pov.capitalize} shot on #{board.cells[shot].ship.name} has caused it to sink!"
    end
  end

  def ending_message
    if @computer_cruiser.sunk? == true && @computer_sub.sunk? == true
    puts "                                   .''.       
    .''.      .        *''*    :_\/_:     . 
   :_\/_:   _\(/_  .:.*_\/_*   : /\ :  .'.:.'.
.''.: /\ :   ./)\   ':'* /\ * :  '..'.  -=:o:=-
:_\/_:'.:::.    ' *''*    * '.\'/.' _\(/_'.':'.'
: /\ : :::::     *_\/_*     -= o =-  /)\    '  *
'..'  ':::'     * /\ *     .'/.\'.   '
   *            *..*         :
     *
     *"
      puts "You won!!"
    else
      puts "You lose! Better luck next time."
    end
    sleep(4.0)
    welcome_screen
  end
end
