require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test


  def setup
    @game = Game.new(@p_board, @c_board)
    @p_board = Board.new
    @c_board = Board.new
    @p_cruiser = Ship.new("Cruiser", 3)
    @c_cruiser = Ship.new("Cruiser", 3)
    @p_submarine = Ship.new("Submarine", 2)
    @c_submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_it_has_welcome_menu
    assert_equal "Welcome to BATTLESHIP", @game.welcome_menu
  end

  def test_it_can_randomize_coordinates
  @c_board = mock("random_c")
  @c_board.expects(:randomizing_coordinates).returns(["A3", "B3", "C3"])
  assert_equal ["A3", "B3", "C3"], @game.randomizing_coordinates
  end

end
