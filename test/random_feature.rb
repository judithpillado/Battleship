require './lib/ship'
require './lib/cell'
require './lib/board'
# require './lib/game'


def randomizing_coordinates
  require "pry"; binding.pry
  if length == 2
    coordinate = "#{rand(65..68).chr}" + (rand(1..4).to_s)
    coordinate.next
    if coordinate == D4

  elsif length == 3
      coordinate.next
      coordinate.next
      end
  else
    p "Try again please."
  end
end
