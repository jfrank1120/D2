require_relative './src/class_map'
require_relative './src/class_prospector'

def check_args?(argv)
  !argv.nil? &&
    argv.count == 2 &&
    argv[0].to_i.is_a?(Integer) &&
    argv[1].to_i.is_a?(Integer)
end

def game_loop(prospector, currmap)
  while prospector.num_moves? <= 5
    cont_mining = 0
    currmap.print_map(prospector.location?.name?)
    while cont_mining.zero?
      cont_mining = mine_metals(prospector)
      prospector.inc_days_traveled
    end
    prospector.move(prospector.location?.next_city?)
    prospector.print_location
  end
  finish_trip(prospector)
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
  found_gold = prospector.found_gold?
  print_findings('Gold', prospector.found_gold?, p_num)
  prospector.add_gold(prospector.found_gold?)
  prospector.set_found_silver(prospector.location?.mine_silver)
  found_silver = prospector.location?.mine_silver
  print_findings('Silver', prospector.found_silver?, p_num)
  prospector.add_silver(prospector.found_silver?)
  check_move(found_silver, found_gold, prospector.loc_count?)
end

def check_later_moves(silver_amt, gold_amt)
  if silver_amt > 0 || gold_amt > 0
    0
  else
    1
  end
end

def check_move(silver_amt, gold_amt, location_num)
  if location_num < 4
    check_later_moves(silver_amt, gold_amt)
  elsif gold_amt <= 1 && silver_amt <= 2
    1
  else
    0
  end
end

def print_findings(metal_type, amt, num)
  if amt.zero?
    return
  end

  amt_str = amt.to_s
  puts '  Prospector ' + num + ' found ' + amt_str + ' Ounces of ' + metal_type
end

def finish_trip(prospector)
  days_traveled_str = prospector.days_traveled?.to_s
  gold_val = prospector.held_gold? * 20.67
  silver_val = prospector.held_silver? * 1.31
  puts 'After ' + days_traveled_str + ' Days, Prospector '
  puts prospector.number?.to_s + ' returned to San Fransico with:'
  print_trip_data(prospector, gold_val, silver_val)
end

def print_trip_data(prospector, gold_val, silver_val)
  gold_str = gold_val.to_s
  silver_str = silver_val.to_s
  print_metal_values(gold_str, prospector.held_gold?, 'Gold')
  print_metal_values(silver_str, prospector.held_silver?, 'Silver')
end

def print_metal_values(val_str, held_amt, metal_type)
  held_amt_str = held_amt.to_s
  if held_amt != 1
    puts held_amt_str + ' Ounces of ' + metal_type + 'worth: $' + val_str
  else
    puts held_amt_str + ' Ounce of ' + metal_type + 'worth: $' + val_str
  end
end

if check_args? ARGV
  args = ARGV
  start_game args
end
