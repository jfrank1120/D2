require 'Minitest/autorun'
require_relative '../src/class_city.rb'

# tests for the city obj
class TestCity < Minitest::Test
  def setup
    @city = City.new(Random.new, 'Sutter Creek', 2, 0)
    @city.add_link City.new(Random.new, 'test1', 0, 0)
    @city.add_link City.new(Random.new, 'test2', 0, 0)
  end

  # Unit test to check that the set name of a city can begin
  # accessed by using the .name? method
  def test_title_set
    assert_equal('Sutter Creek', @city.name?)
  end

  # Tests that a the creation of a new city creates a new
  # city object
  def test_new_city
    test_new_city = City.new(Random.new, "test_new_city", 0, 0)
    assert_instance_of City, test_new_city
  end

  # Tests that the gold search does not return nil
  def test_gold_search_not_nill
    refute_nil @city.mine_gold
  end

  # Tests that silver search does not return nil
  def test_silver_search_not_nill
    refute_nil @city.mine_silver
  end

  # Unit test to check that gold cannot be set above
  # max value
  # EDGE CASE
  def test_max_gold_set
    assert_equal(2, @city.gold?)
  end

  # Unit test to see that the silver value cannot be set
  # above the maximum silver value
  def test_max_silver_set
    assert_equal(0, @city.silver?)
  end

  # Unit test to check if a link to another city is correctly
  # linked to the current city
  def test_add_link
    test = City.new(Random.new, 'test3', 0, 0)
    @city.add_link test
    assert_includes @city.links?, test
  end

  # Tests that a city that is linked to the city appears within
  # its listing of links
  def test_next_city
    assert_includes @city.links?, @city.next_city?
  end
end
