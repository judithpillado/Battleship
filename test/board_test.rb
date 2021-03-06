require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_board_cells
    assert_equal ["A1", "A2", "A3", "A4", "B1"], @board.cells.keys[0..4]
    assert_equal 16, @board.cells.count
    assert_instance_of Hash, @board.cells
  end

  def test_valid_coordinate
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_valid_placement_for_ship_length
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert_equal true, @board.valid_placement?(@cruiser, ["D1", "D2", "D3"])
  end

  def test_valid_placement_for_consecutiveness
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
    assert_equal true, @board.valid_placement?(@submarine, ["C1", "D1"])
  end

  def test_valid_placement_for_not_diagonal
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_it_can_place_ship_with_coordinate_values
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
    @cell_1.ship
    @cell_2.ship
    @cell_3.ship
    assert_equal true, @cell_3.ship == @cell_2.ship
  end

  def test_overlapping_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @board.place(@submarine, ["C1", "C2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
    assert_equal true , @board.valid_placement?(@submarine, ["D1", "D2"])
  end

  def test_rendering_board
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expected1 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    expected2 = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected1, @board.render
    assert_equal expected2, @board.render(true)
  end

end
