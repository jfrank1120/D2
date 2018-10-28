# Main class for running prospector program

require_relative 'class_prospector'
require_relative 'class_city'

# Getting user seed passed in through command arguments
userSeed = ARGV[2]

# City object creation
sutter_creek = city.new(userSeed, "Sutter Creek", 2, 0)
coloma = city.new(userSeed, "Coloma", 3, 0)
angels_camp = city.new(userSeed, "Angels Camp", 4, 0)
nevada_city = city.new(userSeed, "Nevada City", 5, 0)
virginia_city = city.new(userSeed, "Virginia City", 3, 3)
midas = city.new(userSeed, "Midas", 0, 5)
el_dorado_cn = city.new(userSeed, "El Dorado Canyon", 0, 10)

# Sutter creek link creation
sutter_creek.add_link(coloma)
sutter_creek.add_link(angels_camp)

# Coloma link creation
coloma.add_link(virginia_city)
coloma.add_link(sutter_creek)

# Angels Camp link creation
angels_camp.add_link(nevada_city)
angels_camp.add_link(virginia_city)
angels_camp.add_link(sutter_creek)

# Nevada City link creation
nevada_city.add_link(angels_camp)

# Midas link creation
midas.add_link(el_dorado_cn)
midas.add_link(virginia_city)

# El Dorado Canyon link creation
el_dorado_cn.add_link(midas)
el_dorado_cn.add_link(virginia_city)

num_prospectors = ARGV[3]

for j in 1..num_prospectors do
    
