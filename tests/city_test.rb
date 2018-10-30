require 'Minitest/autorun'
require_relative '../src/class_city.rb'

# tests for the city obj
class TestCity < Minitest::Test
  def setup
    @city = City.new(Random.new, 'Sutter Creek', 2, 0)
  end

  def test_title_set
    assert_equal('Sutter Creek', @city.name?)
  end

  def test_gold_search_not_nill
    refute_nil @city.mine_gold
  end

  def test_silver_search_not_nill
    refute_nil @city.mine_silver
  end

  def test_max_gold_set
    assert_equal(2, @city.gold?)
  end

  def test_max_silver_set
    assert_equal(0, @city.silver?)
  end
end