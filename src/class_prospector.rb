# Prospector Object (Mutable)
class Prospector
  def initialize(map)
    @gold_holding = 0
    @silver_holding = 0
    @curr_location = map.start?
    @gold_found = 0
    @silver_found = 0
    @location_count = 0
    @visited = []
  end

  def add_gold(amount)
    @gold_holding += amount
  end

  def add_silver(amount)
    @silver_holding += amount
  end

  def location?
    @curr_location
  end

  def held_gold?
    @gold_holding
  end

  def found_gold?
    @gold_found
  end

  def held_silver?
    @silver_holding
  end

  def found_silver?
    @silver_found
  end

  def num_moves?
    @location_count
  end

  def move(city)
    unless @visited.include?(city)
      @visited << city
    end
    @location_count += 1
    @curr_location = city
  end

  def print_location
    puts "The Prospector is now Aproaching: #{@curr_location.name?}"
  end

end
