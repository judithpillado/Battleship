require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


# Menu

    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    loop do
    ask_to_start = gets.chomp.downcase

      if ask_to_start == "q"
        p "Goodbye"
        exit
      elsif ask_to_start == "p"
        p "Start game"
        break
      else
        p "INVALID RESPONSE. Please enter p or q! "
      end
    end

#Setup
@c_cruiser = Ship.new(@c_cruiser, 3)
@c_sub = Ship.new(@c_sub, 2)

p "Computer is placing ships"
@c_board = Board.new
print @c_board.render
  loop do
  first_ship = @c_board.place("Computer Cruiser", ["A1", "A2", "A3"])
    if first_ship == nil
      p "INVALID COORDINATES"
    else
      break
    end

  @c_board.place(@c_sub, ["B1", "C1"])
      #placing but c_board has @name of c_cruiser coming up nil.
    end

p "Your turn to place your ships!"
@p_board = Board.new
print @p_board.render

p "Above is your board, pick three horizontal or vertical coordinates to place your cruiser ship"
p "Valid coordinates are letters first, then then numbers."
# Use string concactation for setting example

@p_cruiser = Ship.new("Player Cruiser", 3)

  # loop do
    p_cruiser_coords = gets.chomp.upcase
    best_p_coords = p_cruiser_coords.gsub(",", "").split
require "pry"; binding.pry
p_ship_1 = @p_board.place(@p_cruiser, best_p_coords)

# "A1", "A2", "A3"
# "A1, B1, C1"
#
# coordinates.each do |coordinate|
#   coordinate.to_s

  # if p_ship_1 == nil
  #   p "INVALID COORDINATES"
  #   p "Please try again"
  # else
  #   break
  # end

    # @c_board.place(@c_sub, ["A1", "B1"])
    #placing but c_board has @name of c_cruiser coming up nil.
  # end








# require "pry"; binding.pry







# p_board

  # def start_game(p_ship, c_ship)
  #   computer_place_ships
  #   player_place_ships
  # end
  #
  # def computer_place_ships
  #   random_ship_placement
  # end
  #
  #
  # def player_place_ships
  #
  # end
  #
  # def turn
  #
  #   # computer gets to aim at a cell...H, M, X? ship.sunk? == true
  #
  #   #
  #
  # end
  # # puts "You're in a dark room.  Pick door #1 or door #2."
  # # print "type answer here > "
  # #
  # # door = $stdin.gets.chomp
  #
  # p "Welcome to BATTLESHIP"
  # p "Enter p to play.  Enter q to quit"
  # ask_to_start = $stdin.gets.chomp
  # #
  # # if ask_to_start = "q" ||
  # #
  # # if ask_to_start == "p"
  # #   #start game
  # # end
  #
  # # How does it know it's a sub vs a cruiser
  #
  # # get input from p_board and assign it to variable
  # ask_for_sub_coordinates = $stdin.gets.chomp
  #
  # #standardize input from p_board
  # #put coordinates into an arrays
  # ask_for_sub_coordinates.captilize


  # ask_for_sub_coordinates.valid_placement?(submarine, ask_for_sub_coordinates)
  #     if false
  #       p "Those are invalid coordinates. Please try again:"
  #     else
      # end
