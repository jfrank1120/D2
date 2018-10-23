

require 'minitest/autorun'
require_relative 'class_prospector'
require_relative 'class_city'

class ProstpectorTest < Minitest::Test

    def setup
        @prospect = Prospector::new
        @city = City::new
    end

    def test_prospector_is_not_nil
        refute_nil @prospect
        assert_kind_of Prospector, prospect
    end

    def test_city_is_not_nil
        refute_nil @city
        assert_kind_of City, city
    end

    def test_mine_gold
        assert_
    end

    def test_add_gold
        mock_prospector = Minitest::Mock.new('Prospector')
        def mock_prospector.
    end
end
