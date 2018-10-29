require 'minitest/autorun'
require_relative 'class_prospector'
require_relative 'class_city'

class ProstpectorTest < Minitest::Test

    # Create objects to be used in Mock testing
    def setup
        @prospect = Prospector::new
        @city = City::new
    end

    # If a prospector object is created then the prospector
    # should not return nil
    def test_prospector_is_not_nil
        refute_nil @prospect
        assert_kind_of Prospector, prospect
    end

    # If a city object is created then the city
    # should not return nil
    def test_city_is_not_nil
        refute_nil @city
        assert_kind_of City, city
    end

    def test_mine_gold

    end

    # Check that gold is correctly added to the prospector
    def test_add_gold
        prospect = Prospector.new
        prospect.add_gold(10)
        assert_equal prospect.gold_holding 10
    end

    # Test that a prospector can move from one city to another
    def test_move_city
        prospect = Prospector.new
        prospect.move Minitest::Mock.new("")
end
