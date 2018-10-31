require_relative './src/class_map'
require_relative './src/class_prospector'

def check_args?(argv)
  !argv.nil? &&
    argv.count == 2 &&
    argv[0].to_i.is_a?(Integer) &&
    argv[1].to_i.is_a?(Integer)
end

def start_game(args)
  curr_num = 1
  args[1].to_i.times do
    map = Map.new(Random.new(args[0].to_i), [])
    prospector = Prospector.new(map)
    prospector.set_number(curr_num)
    game_loop(prospector, map)
    curr_num += 1
  end
end

def mine_metals(prospector)
  p_num = prospector.number?.to_s
  # Mine for gold and silver in current city
  prospector.set_found_gold(prospector.location?.mine_gold)
  print_findings('Gold', prospector.found_gold?.to_s, p_num)
  prospector.add_gold(prospector.found_gold?)
  prospector.set_found_silver(prospector.location?.mine_silver)
  print_findings('Silver', prospector.found_silver?.to_s, p_num)
  prospector.add_silver(prospector.found_silver?)
end

def print_findings(metal_type, amt, p_num)
  if amount > 0
    puts '  Prospector ' + p_num + ' found ' + amt + ' Ounces of ' + metal_type
  end
end

def finish_trip(prospector)
    gold_val = prospector.held_gold? * 20.67
    silver_val = prospector.held_silver? * 1.31
    puts 'After ' + prospector.days_traveled?.to_s + ' Days, Prospector ' + prospector.number?.to_s + ' returned to San Fransico with:'
    if prospector.held_gold? != 1
        puts prospector.held_gold?.to_s + " Ounces of Gold worth: $" + gold_val.to_s
    else
        puts prospector.held_gold?.to_s + " Ounce of Gold worth: $" + gold_val.to_s
    end
    if prospector.held_silver? != 1
        puts prospector.held_silver?.to_s + " Ounces of Silver worth: $" + silver_val.to_s
    else
        puts prospector.held_silver?.to_s + " Ounce of Silver worth: $" + silver_val.to_s
    end
end

if check_args? ARGV
  args = ARGV
  start_game args
end

def game_loop(prospector, currmap)
    while prospector.num_moves? <= 5
        map.print_map(prospector.location?)
        mine_metals(prospector)
        prospector.move(prospector.location?.next_city?)
        prospector.print_location
    end
    finish_trip(prospector)
end
