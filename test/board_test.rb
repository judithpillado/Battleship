require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_board_cells
    assert_equal ["A1", "A2", "A3", "A4", "B1"], @board.cells.keys[0..4]
    assert_equal 16, @board.cells.count
    assert_instance_of Hash, @board.cells
  end

end
