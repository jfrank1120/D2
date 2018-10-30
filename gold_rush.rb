require_relative './src/class_map'
require_relative './src/class_prospector'
Dir["#{File.dirname(__FILE__)}/tests/*.rb"].each {|file| require file }

def check_args? argv
  argv != nil && argv.count == 2 && argv[0].to_i.is_a?(Integer) && argv[1].to_i.is_a?(Integer)
end

def start_game args
  args[1].to_i.times do
    map = Map.new(Random.new(args[0].to_i))
    prospector = Prospector.new(map)
    while prospector.num_moves? <= 5

      map.print_map prospector.location?
      prospector.move(prospector.location?.next_city?)
      prospector.print_location
    end
  end
end

if check_args? ARGV
  start_game ARGV
end
