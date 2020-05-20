require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

@game = Game.new(@p_board, @c_board)

@game.randomizing_coordinates_cruiser
@game.randomizing_coordinates_submarine
