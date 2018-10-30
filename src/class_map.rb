require_relative 'class_city'

# Map Object (IMUTABLE)
class Map
  def initialize(rand)
    @cities = []
    @cities << City.new(rand, 'Nevada City', 0, 5)
    @cities << City.new(rand, 'Angles Camp', 4, 0)
    @cities << City.new(rand, 'Virginia City', 3, 3)
    @cities << City.new(rand, 'Coloma', 3, 0)
    @cities << City.new(rand, 'Midas', 0, 5)
    @cities << City.new(rand, 'El Dorado Canyon', 0, 10)
    @cities << City.new(rand, 'Sutter Creek', 2, 0)
    @start = @cities[6]
    link_cities
    freeze
  end

  # Linked in acordance with the map
  def link_cities
    @cities[0].add_link(@cities[1])
    @cities[1].add_link(@cities[0])
    @cities[1].add_link(@cities[2])
    @cities[2].add_link(@cities[1])
    @cities[2].add_link(@cities[3])
    @cities[3].add_link(@cities[2])
    @cities[3].add_link(@start)
    @start.add_link(@cities[3])
    @start.add_link(@cities[1])
    @cities[1].add_link(@start)
    @cities[2].add_link(@cities[4])
    @cities[4].add_link(@cities[2])
    @cities[4].add_link(@cities[5])
    @cities[5].add_link(@cities[4])
    @cities[5].add_link(@cities[2])
    @cities[2].add_link(@cities[5])
  end

  def print_map(target = nil)
    a = target == 'Nevada City' ? '<-- Prospector' : ''
    b = target == 'Angles Camp' ? '<-- Prospector' : ''
    c = target == 'Midas' ? '<-- Prospector' : ''
    d = target == 'Virginia City' ? '<-- Prospector|' : '              |'
    e = target == 'El Dorado Canyon' ? '<-- Prospector' : ''
    f = target == 'Coloma' ? '<-- Prospector' : ''
    print "MAP:
    --------------------------------------------------------------------
         Nevada City#{a}
               \\
                \\
                 Angels Camp#{b}
                   |     \\            /---------- Midas#{c}
                   |     Virginia City#{d}
                   |            |    \\              |
                   |            |     \\---------- El Dorado Canyon#{e}
                   |            |
                   |            |
    start -->Sutter Creek ---- Coloma#{f}
    ---------------------------------------------------------------------\n"
  end

  def cities?
    @cities
  end

  def start?
    @start
  end
end
