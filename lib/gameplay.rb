class Gameplay

  def initialize
  end

  # def input
  #   gets.chomp
  # end

  def start_or_quit
    puts "Welcome to BATTLESHIP
    Enter p to play. Enter q to quit."
    # puts "user input"
    input = gets.chomp
    if input == "q"
      sleep(2)
      puts "goodbye"
      self.start_or_quit
    elsif input == "p"
      puts "I have laid out my ships on the grid.
      You now need to lay out your two ships.
      The Cruiser is three units long and the Submarine is two units long."
      begin_game
    else
      puts "Invalid input, please enter p or q."
      until input == "p" || input == "q"
        input
      end
    end
  end

  def begin_game
  end
end