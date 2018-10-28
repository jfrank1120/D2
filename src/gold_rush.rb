# Main class for running prospector program

require_relative 'class_prospector'
require_relative 'class_city'

userSeed = ARGV[2]

sutter_creek = city.new(userSeed, "Sutter Creek", 2, 0)
coloma = city.new(userSeed, "Coloma", 3, 0)
angels_camp = city.new(userSeed, "Angels Camp", 4, 0)
nevada_city = city.new(userSeed, "Nevada City", 5, 0)
virginia_city = city.new(userSeed, "Virginia City", 3, 3)
midas = city.new(userSeed, "Midas", 0, 5)
el_dorado_cn = city.new(userSeed, "El Dorado Canyon", 0, 10)

sutter_creek.add_link()
