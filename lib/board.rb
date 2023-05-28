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
    coordinates.each do |coordinate|
      if !valid_coordinate?(coordinate) || !@cells[coordinate].empty? || !length_check(ship, coordinates)
        return true
      end
    end
    return false
  end

  def valid_placement?(ship, coordinates)
    if placement_fails(ship, coordinates) == true
      return false
    end
    letters = split_coordinates(coordinates)[0]
    numbers = split_coordinates(coordinates)[1]
    if consecutive_letters(letters, numbers)
      return true
    elsif consecutive_numbers(letters, numbers)
      return true
    else 
      return false
    end
  end

  def split_coordinates(coordinates)
    letters = []
    numbers = []
    coordinates.each do |coordinate|
      letters << coordinate.split("",2)[0].ord
      numbers << coordinate.split("",2)[1].to_i
    end
    return [letters, numbers]
  end
end

