require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class Game

  def initialize(p_board, c_board)
    @p_board = p_board
    @c_board = c_board
  end

  def welcome_menu
    p "Welcome to BATTLESHIP"
  end

  def start_game
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    loop do
    ask_to_start = $stdin.gets.chomp.downcase
      if ask_to_start == "q"
        p "¡Adiós!"
        exit
      elsif ask_to_start == "p"
        p "Okay, let's start the game!"
        exit
      else
        p "INVALID RESPONSE. Please enter p or q! "
      end
    end
  end

end
