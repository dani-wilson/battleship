class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def length_check(ship, coordinates)
    coordinates.count == ship.length
  end

  def consecutive_numbers(letters, numbers)
    numbers.each_cons(2).all? {|a,b| b == a + 1} && letters.each_cons(2).all? {|a,b| b == a}
  end

  def consecutive_letters(letters, numbers)
    letters.each_cons(2).all? {|a,b| b == a + 1} && numbers.each_cons(2).all? {|a,b| b == a}
  end

  def placement_fails(ship, coordinates)
    if length_check(ship, coordinates) == false
      return true
    else
      coordinates.each do |coordinate|
        if !valid_coordinate?(coordinate) || !@cells[coordinate].empty?
          return true
        else
          return false
        end
      end
    end
  end

  def valid_placement?(ship, coordinates)
    if coordinates == []
      false
    else
      letters = split_coordinates(coordinates)[0]
      numbers = split_coordinates(coordinates)[1]
      if placement_fails(ship, coordinates) == true
        return false
      elsif consecutive_letters(letters, numbers) || consecutive_numbers(letters, numbers)
        return true
      else 
        return false
      end
    end
  end

  def split_coordinates(coordinates)
    letters = []
    numbers = []
    # binding.pry
    coordinates.flatten.each do |coordinate|
      letters << coordinate.split("",2)[0].ord
      numbers << coordinate.split("",2)[1].to_i
    end
    return [letters, numbers]
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render_board(peek = false)
    array1 = [1, 2, 3, 4]
    if peek == true
      array2 = ["A", @cells["A1"].render(true), @cells["A2"].render(true), @cells["A3"].render(true), @cells["A4"].render(true)]
      array3 = ["B", @cells["B1"].render(true), @cells["B2"].render(true), @cells["B3"].render(true), @cells["B4"].render(true)]
      array4 = ["C", @cells["C1"].render(true), @cells["C2"].render(true), @cells["C3"].render(true), @cells["C4"].render(true)]
      array5 = ["D", @cells["D1"].render(true), @cells["D2"].render(true), @cells["D3"].render(true), @cells["D4"].render(true)]
    else
      array2 = ["A", @cells["A1"].render, @cells["A2"].render, @cells["A3"].render, @cells["A4"].render]
      array3 = ["B", @cells["B1"].render, @cells["B2"].render, @cells["B3"].render, @cells["B4"].render]
      array4 = ["C", @cells["C1"].render, @cells["C2"].render, @cells["C3"].render, @cells["C4"].render]
      array5 = ["D", @cells["D1"].render, @cells["D2"].render, @cells["D3"].render, @cells["D4"].render]
    end
  
    puts ("\n") + (" ") + (" ") + array1.join(" ") + ("\n") + array2.join(" ") + ("\n") + array3.join(" ") + ("\n") + array4.join(" ") + ("\n") + array5.join(" ")
  end
end


