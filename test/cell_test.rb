require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists

    assert_instance_of Cell, @cell
  end

  def test_it_has_a_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_it_has_a_ship
    assert_nil @cell.ship
  end

  def test_empty
    assert_equal true, @cell.empty?
  end

  def test_it_can_place_a_ship
    @cell.place_ship(@cruiser)
    assert_equal @cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end

  def test_it_can_be_fired_upon
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.fired_upon?
    @cell.fire_upon
    # require 'pry'; binding.pry
    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?

  end

end
