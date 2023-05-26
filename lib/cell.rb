class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @render = "."
  end

  def empty?
    if !@ship
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship
      @ship.hit
    end
  end

  def render(peek = false)
    if @fired_upon == false
      if peek == true && @ship
        @render = "S"
      else
        @render
      end
    else 
        if !@ship
        @render = "M"
      else
        @render = "H"
      end
    end
  end

end