require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


# Welcome Menu

  def welcome_menu
    p "Welcome to BATTLESHIP"
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
      end
  end


  def randomizing_coordinates
    coordinate = "#{rand(65..68).chr}" + (rand(1..4).to_s)
    if valid_placement(ship_type, coordinate_value)
        if length == 2
          coordinate.next
        elsif length == 3
          coordinate.next
          coordinate.next
        end
    else
      p "Try again please."
    end
  end
#
#
#
# #Setup Computer
#     @c_cruiser = Ship.new("Computer Cruiser", 3)
#     @c_sub = Ship.new(@c_sub, 2)
#     @c_board = Board.new
#
#     p "Computer is placing ships"
#
#     # Random Coordinate Settings
#
#       # code here
#
#
#         loop do
#       # Place Cruiser
#           first_ship = @c_board.place(@c_cruiser, ["A1", "A2", "A3"])
#             if first_ship == nil
#               p "INVALID COORDINATES"
#             else
#               break
#             end
#       # Place Submarine
#           @c_board.place(@c_sub, ["B1", "C1"])
#               #placing but c_board has @name of c_cruiser coming up nil.
#           end
#
# #Setup Player
#     @p_board = Board.new
#
#         p "Your turn to place your ships."
#
#             print @p_board.render
#
#         p "Above is your board, pick three horizontal or vertical coordinates to place your cruiser ship. Valid coordinates are letters first, then then numbers."
#         p "Example "+"A1, A2, A3"
#
#
#       @p_cruiser = Ship.new("Player Cruiser", 3)
#
#       loop do
#         p_cruiser_coords = gets.chomp.upcase
#
#         best_p_coords = p_cruiser_coords.gsub(",", "").split
#
#         p_ship_1 = @p_board.place(@p_cruiser, best_p_coords)
#
#             if p_ship_1 == nil
#               p "INVALID COORDINATES"
#             else
#               break
#             end
#       end
#
# # First turn
#
#     =============COMPUTER BOARD=============
#     print @c_board.render
#
#     ==============PLAYER BOARD==============
#     print @p_board.render
# # Integrate so that the turns keep going until there is one winner and ensure that the board keeps rendering.
#         if p_cruiser.sunk? == true && p_sub.sunk? == true
#         "Computer wins!"
#         else
#             turn
#         end
#         if c_cruiser.sunk? == true && c_sub.sunk? == true
#         "You win!"
#         else
#           turn
#         end
