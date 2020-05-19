require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

# puts "You're in a dark room.  Pick door #1 or door #2."
# print "type answer here > "
#
# door = $stdin.gets.chomp

p "Welcome to BATTLESHIP"
p "Enter p to play.  Enter q to quit"
p "> "
ask_to_start = $stdin.gets.chomp
#standardize answer
if ask_to_start = "q" ||

if ask_to_start = "p"
  #start game
end

# How does it know it's a sub vs a cruiser
ask_for_cruisers_coordinates = $stdin.gets.chomp

# get input from p_board and assign it to variable
ask_for_sub_coordinates = $stdin.gets.chomp

#standardize input from p_board
#put coordinates into an arrays
ask_for_sub_coordinates.captilize


ask_for_sub_coordinates.valid_placement?(submarine, ask_for_sub_coordinates)
    if false
      p "Those are invalid coordinates. Please try again:"
    else
    end
