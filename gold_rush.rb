require_relative './src/class_map'
require_relative './src/class_prospector'


def check_args? argv
  argv != nil && argv.count == 2 && argv[0].to_i.is_a?(Integer) && argv[1].to_i.is_a?(Integer)
end

def start_game args
  curr_num = 1
  args[1].to_i.times do
    map = Map.new(Random.new(args[0].to_i), [])
    prospector = Prospector.new(map)
    prospector.set_number(curr_num)

    while prospector.num_moves? <= 5
        map.print_map(prospector.location?)
        #Still need to check if the prospector should move cities or not based
        #on the amount of metals they were able to attain 
        mine_metals(prospector)
        prospector.move(prospector.location?.next_city?)
        prospector.print_location
    end
    finish_trip(prospector)
    curr_num += 1
  end
end

def mine_metals(prospector)
    # Mine for gold and silver in current city
    prospector.set_found_gold(prospector.location?.mine_gold)
    if prospector.found_gold? > 0
        puts "  Prospector " + prospector.number?.to_s + " found " + prospector.found_gold?.to_s + "Ounces of Gold!"
    end
    prospector.add_gold(prospector.found_gold?)
    prospector.set_found_silver(prospector.location?.mine_silver)
    if prospector.found_silver? > 0
        puts "  Prospector " + prospector.number?.to_s + " found " + prospector.found_silver?.to_s + " Ounces of Silver!"
    end
    prospector.add_silver(prospector.found_silver?)
end

def finish_trip(prospector)
    gold_val = prospector.held_gold? * 20.67
    silver_val = prospector.held_silver * 1.31
    puts "After " + prospector.days_traveled?.to_s + " Prospector " + prospector.number? + " returned to San Fransico with:"
end

if check_args? ARGV
  start_game ARGV
end
