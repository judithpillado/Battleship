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
    @ship_type.length == @coordinate_values.length
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

  def valid_placement?(ship_type, coordinate_values)
    @ship_type = ship_type
    @coordinate_values = coordinate_values
    letters = []
    numbers = []
    coordinate_values.each do |coordinate|
      letters << coordinate[0]
      numbers << coordinate[1]
    end
    if consecutive(letters) && identical(numbers) && valid_length
      true
    elsif consecutive(numbers) && identical(letters) && valid_length
      true
    else
      false
    end
  end

end
