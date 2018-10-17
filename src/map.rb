require_relative "class_city"
# Cities File
class MAP
  def initialize(rand)
    @Cities = []
    @Cities << City.new(rand, "Nevada City", 0, 5)
    @Cities << City.new(rand, "Angles Camp", 4, 0)
    @Cities << City.new(rand, "Virgina City", 3, 3)
    @Cities << City.new(rand, "Coloma", 3, 0)
    @Cities << City.new(rand, "Midas", 0, 5)
    @Cities << City.new(rand, "El Dorado Canyon", 0, 10)
    @Cities << City.new(rand, "Sutter Creek", 1, 0)
    @Start = @Cities[6]
    link_cities
  end

  #linked in acordance with the map
  def link_cities
    @Cities[0].Addlink(@Cities[1])
    @Cities[1].Addlink(@Cities[0])
    @Cities[1].Addlink(@Cities[2])
    @Cities[2].Addlink(@Cities[1])
    @Cities[2].Addlink(@Cities[3])
    @Cities[3].Addlink(@Cities[2])
    @Cities[3].Addlink(@Start)
    @Start.Addlink(@Cities[3])
    @Start.Addlink(@Cities[1])
    @Cities[1].Addlink(@Start)
    @Cities[2].Addlink(@Cities[4])
    @Cities[4].Addlink(@Cities[2])
    @Cities[4].Addlink(@Cities[5])
    @Cities[5].Addlink(@Cities[4])
    @Cities[5].Addlink(@Cities[2])
    @Cities[2].Addlink(@Cities[5])
  end

  def printMap target = nil
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
    ---------------------------------------------------------------------"
  end

  def cities?
    @Cities
  end

  def name?
    @name
  end

  def start?
    @Start
  end
end

map2 = MAP.new(Random.new(1234))
map2.printMap
puts map2.start?.links?.count
