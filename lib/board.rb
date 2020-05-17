require 'enumerator'

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

  def valid_length
    @ship_type.length == @coordinate_value.length
  end

  def valid_coordinate?(coordinate_parameter)
    result = @cells["#{coordinate_parameter}"]
    if result == nil
      @valid_coordinate = false
    else
      @valid_coordinate = true
    end
  end

  def consecutive(coordinate_value)
    coordinate_value.each_cons(2).all?  { |first, second| second == first.next }
  end

  def identical(coordinate_value)
    if coordinate_value.uniq.count == 1
      true
    end
  end

  def available_cell(coordinate_value)
    coordinate_value.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def valid_placement?(ship_type, coordinate_value)
    @ship_type = ship_type
    @coordinate_value = coordinate_value
    letters = []
    numbers = []
    coordinate_value.each do |coordinate|
      letters << coordinate[0]
      numbers << coordinate[1]
    end
    if consecutive(letters) && identical(numbers) && valid_length && available_cell(coordinate_value)
      true
    elsif consecutive(numbers) && identical(letters) && valid_length && available_cell(coordinate_value)
      true
    else
      false
    end
  end

  def place(ship_type, coordinate_value)
    if valid_placement?(ship_type, coordinate_value)
      coordinate_value.each do |coordinate|
       cell = @cells[coordinate]
       cell.place_ship(ship_type)
     end
    end
  end

  def render(show = false)
    "  1 2 3 4 \n" +
    "A #{cells["A1"].render(show)} #{cells["A2"].render(show)} #{cells["A3"].render(show)} #{cells["A4"].render(show)} \n" +
    "B #{cells["B1"].render(show)} #{cells["B2"].render(show)} #{cells["B3"].render(show)} #{cells["B4"].render(show)} \n" +
    "C #{cells["C1"].render(show)} #{cells["C2"].render(show)} #{cells["C3"].render(show)} #{cells["C4"].render(show)} \n" +
    "D #{cells["D1"].render(show)} #{cells["D2"].render(show)} #{cells["D3"].render(show)} #{cells["D4"].render(show)} \n"
  end

end
