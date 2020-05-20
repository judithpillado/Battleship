require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class Game
  attr_reader :p_board,
              :c_board,
              :p_cruiser,
              :c_cruiser,
              :p_submarine,
              :c_submarine

  def initialize(p_board, c_board)
    @p_board = Board.new
    @c_board = Board.new
    @p_cruiser = Ship.new("Cruiser", 3)
    @c_cruiser = Ship.new("Cruiser", 3)
    @p_submarine = Ship.new("Submarine", 2)
    @c_submarine = Ship.new("Submarine", 2)
  end

  def start_game
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    loop do
      ask_to_start = gets.chomp.downcase
      if ask_to_start == "q"
        p "¡Adiós!"
        exit
      elsif ask_to_start == "p"
        p "Start game"
        break
      else
        p "INVALID RESPONSE. Please enter p or q!"
      end
      p "Computer is placing ships"
    end

#Setup Computer


    # Random Coordinate Settings

      # code here

        loop do
      # Place Cruiser
          first_ship = @c_board.place(@c_cruiser, ["A1", "A2", "A3"])
            if first_ship == nil
              p "INVALID COORDINATES"
            else
              break
            end
      # Place Submarine
          @c_board.place(@c_sub, ["B1", "C1"])
              #placing but c_board has @name of c_cruiser coming up nil.
          end

#Setup Player
    @p_board = Board.new

        p "Your turn to place your ships."

            print @p_board.render

        p "Above is your board, pick three horizontal or vertical coordinates to place your cruiser ship. Valid coordinates are letters first, then then numbers."
        p "Example "+"A1, A2, A3"


      @p_cruiser = Ship.new("Player Cruiser", 3)

      loop do
        p_cruiser_coords = gets.chomp.upcase

        best_p_coords = p_cruiser_coords.gsub(",", "").split

        p_ship_1 = @p_board.place(@p_cruiser, best_p_coords)

            if p_ship_1 == nil
              p "INVALID COORDINATES"
            else
              break
            end
      end

# First turn

    "=============COMPUTER BOARD============="
    print @c_board.render

    "==============PLAYER BOARD=============="
    print @p_board.render
# Integrate so that the turns keep going until there is one winner and ensure that the board keeps rendering.
        if @p_cruiser.sunk? == true && @p_sub.sunk? == true
        "Computer wins!"
        else
            @turn
        end
        if @c_cruiser.sunk? == true && @c_sub.sunk? == true
        "You win!"
        else
          @turn
        end
end



  def randomizing_coordinates_cruiser
    loop do
      first_coordinate = "#{rand(65..68).chr}" + (rand(1..4).to_s)
      second_coordinate = "#{rand(65..68).chr}" + (rand(1..4).to_s)
      third_coordinate = "#{rand(65..68).chr}" + (rand(1..4).to_s)
      cruiser_coordinates = []
      cruiser_coordinates << first_coordinate
      cruiser_coordinates << second_coordinate
      cruiser_coordinates << third_coordinate

      good_cruiser_coordinates = @c_board.valid_placement?(@c_cruiser, cruiser_coordinates)
      if good_cruiser_coordinates == true
        @c_board.place(@c_cruiser, cruiser_coordinates)
        break
      end
    end
  end

  def randomizing_coordinates_submarine
    loop do
      fourth_coordinate = "#{rand(65..68).chr}" + (rand(1..4).to_s)
      fifth_coordinate = "#{rand(65..68).chr}" + (rand(1..4).to_s)
      submarine_coordinates = []
      submarine_coordinates << fourth_coordinate
      submarine_coordinates << fifth_coordinate
      good_submarine_coordinates = @c_board.valid_placement?(@c_submarine, submarine_coordinates)
      if good_submarine_coordinates == true
        @c_board.place(@c_submarine, submarine_coordinates)
        break
      end
    end
  end

end
