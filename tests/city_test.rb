require 'Minitest/autorun'
require_relative '../src/class_city.rb'

# tests for the city obj
class TestCity < Minitest::Test
  def setup
    @city = City.new(Random.new, 'Sutter Creek', 2, 0)
    @city.add_link City.new(Random.new, 'test1', 0, 0)
    @city.add_link City.new(Random.new, 'test2', 0, 0)
  end

  def test_title_set
    assert_equal('Sutter Creek', @city.name?)
  end

  def test_new_city
    test_new_city = City.new(Random.new, "test_new_city", 0, 0)
    assert_instance_of City, test_new_city
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

  def test_add_link
    test = City.new(Random.new, 'test3', 0, 0)
    @city.add_link test
    assert_includes @city.links?, test
  end

  def test_next_city
    assert_includes @city.links?, @city.next_city? 
  end
end