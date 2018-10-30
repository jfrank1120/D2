require 'minitest/autorun'
require_relative '../src/class_prospector'
require_relative '../src/class_city'

class ProstpectorTest < Minitest::Test

    # Create objects to be used in Mock testing
    def setup
        @map = Map.new(Random.new)
        @prosp = Prospector.new(@map)
    end

    # If a prospector object is created then the prospector
    # should not return nil
    def test_prospector_is_not_nil
        refute_nil @prospect
        assert_kind_of Prospector, @prosp
    end

    # Check that gold is correctly added to the prospector
    def test_add_gold
        @prosp = Prospector.new
        @prosp.add_gold(10)
        assert_equal prospect.gold_holding 10
    end

    # Test that a prospector can move from one city to another
    def test_move_city
        city1 = Minitest::Mock::new "mock city"
        def city1.name
            "New City"
        end
        @prosp.move city1
        assert_equal "New City", @prosp.location?
    end

    # Test that the number of moves increments correctly
    def test_num_moves
        test_city = Minitest::Mock::new "mock city"
        @prosp.move city1
        assert_equal 1, @prosp.num_moves?
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
