class Cell
  attr_reader :coordinate,
              :ship,
              :render

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
    if !@ship
      @render = "M"
    else
      @render = "H"
      @ship.hit
    end
  end

end