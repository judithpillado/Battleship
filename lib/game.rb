require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class Game

  def initialize(p_board, c_board)
    @p_board = p_board
    @c_board = c_board
  end

    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    loop do
    ask_to_start = $stdin.gets.chomp.downcase
    # require "pry";binding.pry

      if ask_to_start == "q"
        p "Goodbye"
        exit
      elsif ask_to_start == "p"
        p "Start game"
        exit
      else
        p "INVALID RESPONSE. Please enter p or q! "
      end
    end



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

end
