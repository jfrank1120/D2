require_relative 'class_city'

# Map Object (IMUTABLE)
class Map
  def initialize(userSeed)
    @cities = []
    @sutter_creek = City.new(userSeed, "Sutter Creek", 2, 0)
    @coloma = City.new(userSeed, "Coloma", 3, 0)
    @angels_camp = City.new(userSeed, "Angels Camp", 4, 0)
    @nevada_city = City.new(userSeed, "Nevada City", 5, 0)
    @virginia_city = City.new(userSeed, "Virginia City", 3, 3)
    @midas = City.new(userSeed, "Midas", 0, 5)
    @el_dorado_cn = City.new(userSeed, "El Dorado Canyon", 0, 10)
    citiesToArray
    # Places the start at Sutter Creek
    @start = @cities[0]
    link_cities
    freeze
  end

  def citiesToArray
    @cities << @sutter_creek
    @cities << @coloma
    @cities << @angels_camp
    @cities << @nevada_city
    @cities << @virginia_city
    @cities << @midas
    @cities << @el_dorado_cn
  end

  # Linked in acordance with the map
  def link_cities


    # Sutter creek link creation
    @sutter_creek.add_link(@coloma)
    @sutter_creek.add_link(@angels_camp)

    # Coloma link creation
    @coloma.add_link(@virginia_city)
    @coloma.add_link(@sutter_creek)

    # Angels Camp link creation
    @angels_camp.add_link(@nevada_city)
    @angels_camp.add_link(@virginia_city)
    @angels_camp.add_link(@sutter_creek)

    # Nevada City link creation
    @nevada_city.add_link(@angels_camp)

    # Midas link creation
    @midas.add_link(@el_dorado_cn)
    @midas.add_link(@virginia_city)

    # El Dorado Canyon link creation
    @el_dorado_cn.add_link(@midas)
    @el_dorado_cn.add_link(@virginia_city)
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
    Start -->Sutter Creek ---- Coloma#{f}
    ---------------------------------------------------------------------\n"
  end

  def cities?
    @cities
  end

  def start?
    @start
  end
end
