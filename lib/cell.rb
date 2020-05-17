class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship 
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !empty?
      @ship.hit
    end
    @fired_upon = true
  end

  def render(show = false)
    if show == true && !@fired_upon && !empty?
      "S"
    elsif !@fired_upon
      "."
    elsif @fired_upon && empty?
      "M"
    elsif @fired_upon && !@ship.sunk?
      "H"
    else @fired_upon && @ship.sunk?
      "X"
    end
  end

end
