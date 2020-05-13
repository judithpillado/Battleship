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
      ship.hit
    end
    @fired_upon = true
  end

  def render(*)
    if @fired_upon == false
      p "."
    elsif @fired_upon == true && @ship.health == @ship.length
      p "M"
    elsif @fired_upon == true && @ship.sunk? == false
      p "H"
    else @fired_upon == true && @ship.sunk? == true
      p "X"
    end 
  end

end
