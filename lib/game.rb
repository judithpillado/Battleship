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
    computer_pause_for_effect

    player_cruiser_coordinates
    player_submarine_coordinates
    p "When you fire upon a coordinate, you will either see M, H, or X."
    p "M means you missed and did not hit a ship."
    p "H means you hit a part of the ship."
    p "X means you hit the entire ship and it has now sunk."

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner

    game_board_rendering
    turn
    winner
    # finding_winner


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

  def computer_pause_for_effect
    p ".....Computer is placing ships"
  end

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
      if p_cruiser_valid_coordinates == false
        p "please re-enter valid coordinates."
        elsif p_cruiser_valid_coordinates == true
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
          if p_submarine_valid_coordinates == false
            p "please re-enter valid coordinates."
          elsif p_submarine_valid_coordinates == true
            @p_board.place(@p_submarine, best_p_submarine)
            break
          end
      end
      p "Here's your board. Get ready to play!"
  end

  def game_board_rendering
    p "=============COMPUTER BOARD============="
      print @c_board.render
      #make sure we revert to no parameter
    p "==============PLAYER BOARD=============="
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
      if @c_board.valid_coordinate?(cell_to_fire_upon) == false
        p "please re-enter valid coordinate"
      elsif @c_board.cells[cell_to_fire_upon].fired_upon? == false
          @c_board.cells[cell_to_fire_upon].fire_upon
          break
      else
        p "Please re-enter a new coordinate"
      end
    end
  end

  def computer_turn
    random_fire = "#{rand(65..68).chr}" + (rand(1..4).to_s)
    if @p_board.cells[random_fire].fired_upon? == false
      @p_board.cells[random_fire].fire_upon
    end
  end

  def winner
    # require "pry"; binding.pry
    if @p_cruiser.sunk? == true && @p_submarine.sunk? == true
      p "You lost! You lost! You lost! You lost! You lost! You lost! You lost! You lost! You lost! You lost! You lost! You lost! You lost! You lost!"
      exit
    elsif @c_cruiser.sunk? == true && @c_submarine.sunk? == true
      p "You win! You win! You win! You win! You win! You win! You win! You win! You win! You win! You win! You win! You win!"
      exit
    else
      p "Nice hit!"
    end
  end

end
