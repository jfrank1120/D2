require_relative './class_city'

# Map Object (IMUTABLE)
class Map
  def initialize(user_seed, cities)
    @cities = cities
    @sutter_creek = City.new(user_seed, 'Sutter Creek', 2, 0)
    @coloma = City.new(user_seed, 'Coloma', 3, 0)
    @angels_camp = City.new(user_seed, 'Angels Camp', 4, 0)
    @nevada_city = City.new(user_seed, 'Nevada City', 5, 0)
    @virginia_city = City.new(user_seed, 'Virginia City', 3, 3)
    @midas = City.new(user_seed, 'Midas', 0, 5)
    @el_dorado_cn = City.new(user_seed, 'El Dorado Canyon', 0, 10)
    cities_to_array
    # Places the start at Sutter Creek
    @start = @sutter_creek
    link_cities
  end

  def cities_to_array
    @start = @sutter_creek
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
    vec = []
    vec << target == 'Nevada City' ? '<-- Prospector' : ''
    vec << target == 'Angles Camp' ? '<-- Prospector' : ''
    vec << target == 'Midas' ? '<-- Prospector' : ''
    vec << target == 'Virginia City' ? '<-- Prospector|' : '              |'
    vec << target == 'El Dorado Canyon' ? '<-- Prospector' : ''
    vec << target == 'Coloma' ? '<-- Prospector' : ''
    map_vec_to_print vec
  end

  def map_vec_to_print vec
    print "MAP:
    --------------------------------------------------------------------
         Nevada City#{vec[0]}
               \\
                \\
                 Angels Camp#{vec[1]}
                   |     \\            /---------- Midas#{vec[2]}
                   |     Virginia City#{vec[3]}
                   |            |    \\              |
                   |            |     \\---------- El Dorado Canyon#{vec[4]}
                   |            |
                   |            |
    Start -->Sutter Creek ---- Coloma#{vec[5]}
    ---------------------------------------------------------------------\n"
  end

  def cities?
    @cities
  end

  def start?
    @start
  end
end
