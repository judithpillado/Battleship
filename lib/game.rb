class Game

  def initialize(p_board, c_board)
    @p_board = p_board
    @c_board = c_board
  end

  def welcome_menu
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    ask_to_start = $stdin.gets.chomp.downcase

      if "q"
        exit
      elsif "p"
        #NEXT METHOD
      else
        "invalid response please enter valid response"

  end



end
