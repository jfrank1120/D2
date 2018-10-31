# Prospector Object (Mutable)
class Prospector
  def initialize(map)
    @number = 0
    @gold_holding = 0
    @silver_holding = 0
    @curr_location = map.start?
    @gold_found = 0
    @silver_found = 0
    @location_count = 0
    @visited = []
    @days_traveled = 0
  end

  def days_traveled?
      @days_traveled
  end

  def inc_days_traveled
      @days_traveled += 1
  end

  def number?
      @number
  end

  def set_number(num)
      @number = num
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

  def set_found_gold(amount)
      @gold_found = amount
  end

  def found_gold?
    @gold_found
  end

  def held_silver?
    @silver_holding
  end

  def set_found_silver(amount)
      @silver_found = amount
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
    puts "The Prospector #{@number} is now Aproaching: #{@curr_location.name?}"
    if @gold_holding != 1
        puts "Currently Holding: " + @gold_holding.to_s + " Ounces of Gold"
    else
        puts "Currently Holding: " + @gold_holding.to_s + " Ounce of Gold"
    end
    if @silver_holding != 1
        puts "Currently Holding: " + @silver_holding.to_s + " Ounces of Silver"
    else
        puts "Currently Holding: " + @silver_holding.to_s + " Ounce of Silver"
    end
  end

end
