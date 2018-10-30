require 'Minitest/autorun'
require_relative '../src/class_prospector'
require_relative '../src/class_map'

# tests for the city obj
class TestMap < Minitest::Test
  def setup
    @map = Map.new(Random.new)
    @prosp = Prospector.new(@map)
    assert_instance_of(Prospector, @prosp)
  end

  def test_location_city_type
    assert_instance_of(City, @prosp.location?)
  end

  def test_initial_values
    assert_equal(0, @prosp.held_gold?)
    assert_equal(0, @prosp.held_silver?)
    assert_equal(0, @prosp.found_gold?)
    assert_equal(0, @prosp.found_silver?)
    assert_equal(0, @prosp.num_moves?)
  end

  def test_move_next
    next_city = @prosp.location?.next_city?
    assert_instance_of(City, next_city)
    @prosp.move next_city
    assert_same(@prosp.location?, next_city)
  end
end
