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
    welcome_menu

    randomizing_coordinates_cruiser
    randomizing_coordinates_submarine

    player_cruiser_coordinates
    player_submarine_coordinates


    turn
    winner_celebration

  end


  def welcome_menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    loop do
      ask_to_start = gets.chomp.downcase
      if ask_to_start == "q"
        p "¡Adiós!"
        exit
      elsif ask_to_start == "p"
        p "Let's Go!"
        break
      else
        p "INVALID RESPONSE. Please enter p or q!"
      end
      p "Computer is placing ships"
  end

#Setup Computer

  # Random Coordinate Settings
    # Place Cruiser
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

    # Place Submarine
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




#Setup Player

      # Player Cruiser
      def player_cruiser_coordinates
        p "Your turn to place your cruiser."

        p "Cruiser has 3 coordinates"

        print @p_board.render

        p "Above is your board, pick three horizontal or vertical coordinates to place your cruiser ship. Valid coordinates are letters first, then then numbers."
        p "Example "+"A1, A2, A3"

        loop do
          p_cruiser_coordinates = gets.chomp.upcase

          best_p_cruiser = p_cruiser_coordinates.gsub(",", "").split

              p_cruiser_valid_coordinates = @p_board.valid_placement?(@p_cruiser, best_p_cruiser)

                  if p_cruiser_valid_coordinates == true
                    @p_board.place(@p_cruiser, best_p_cruiser)
                    break
                  end
            end
      end


  def player_submarine_coordinates
    p "Awesome, now for your submarine."

    p "Submarine has 2 coordinates, and you won't be able to place it on the same spots as your cruisers."

    print @p_board.render(true)

    p "Above is your board, pick two horizontal or vertical coordinates to place your submarine ship. Valid coordinates are letters first, then then numbers. We showed you where your ships are for your convenience."

    p "Example "+"A1, A2"

      loop do
        p_submarine_coordinates = gets.chomp.upcase

        best_p_submarine = p_submarine_coordinates.gsub(",", "").split

        p_submarine_valid_coordinates = @p_board.valid_placement?(@p_submarine, best_p_submarine)

          if p_submarine_valid_coordinates == true
            @p_board.place(@p_submarine, best_p_submarine)
            break
          end
      end
  end

# First turn
# Integrate so that the turns keep going until there is one winner and ensure that the board keeps rendering.
  def game_board_rendering
    "=============COMPUTER BOARD============="
      print @c_board.render(true)
      #make sure we revert to no parameter

    "==============PLAYER BOARD=============="
      print @p_board.render(true)
  end

    def turn
      player_turn
      computer_turn
    end

    def player_turn
      p "It's your turn!  Please enter a coordinate you want to hit!"
      loop do
      p_turn = gets.chomp.upcase

      cell_to_fire_upon = p_turn.gsub(",", "").to_s

      # require "pry"; binding.pry
        if @c_board.cells[cell_to_fire_upon].fired_upon? == false
            @c_board.cells[cell_to_fire_upon].fire_upon
            break
        else
          p "Please re-enter a new coordinate"
      end
    end

    def computer_turn

      random_fire = "#{rand(65..68).chr}" + (rand(1..4).to_s)
      # random_fire == ???

      @p_board.cells[sdfdsf].fire_upon
    end

    def winner?
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




end
end
end
