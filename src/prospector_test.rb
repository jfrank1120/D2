require 'minitest/autorun'
require_relative 'class_prospector'
require_relative 'class_city'

class ProstpectorTest < Minitest::Test

    # Create objects to be used in Mock testing
    def setup
        @prospect = Prospector::new
    end

    # If a prospector object is created then the prospector
    # should not return nil
    def test_prospector_is_not_nil
        refute_nil @prospect
        assert_kind_of Prospector, prospect
    end

    # Check that gold is correctly added to the prospector
    def test_add_gold
        prospect = Prospector.new
        prospect.add_gold(10)
        assert_equal prospect.gold_holding 10
    end

    # Test that a prospector can move from one city to another
    def test_move_city
        city1 = Minitest::Mock::new "mock city"
        def city1.name
            "New City"
        end
        prospect.move city1
        assert_equal "New City", prospect.location?
    end

    # Test that the number of moves increments correctly
    def test_num_moves
        test_city = Minitest::Mock::new "mock city"
        prospect.move city1
        assert_equal 1, prospector.num_moves?
    end
end
