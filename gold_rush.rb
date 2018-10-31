require_relative './src/class_map'
require_relative './src/class_prospector'

def check_args?(argv)
  !argv.nil? &&
    argv.count == 2 &&
    argv[0].to_i.is_a?(Integer) &&
    argv[1].to_i.is_a?(Integer)
end

def start_game(args)
  args[1].to_i.times do
    map = Map.new(Random.new(args[0].to_i), [])
    game_loop Prospector.new(map), map
  end
end

if check_args? ARGV
  args = ARGV
  start_game args
end

def game_loop(prospector, currmap)
  while prospector.num_moves? <= 5
    puts `Prospector moves: #{prospector.num_moves?.to_s}`
    currmap.print_map(prospector.location?)
    prospector.move(prospector.location?.next_city?)
    prospector.print_location
  end
end
