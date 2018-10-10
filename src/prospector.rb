# Prospector file

require_relative "cities.rb"
class Prospector
    # Inital variables for the prospector
    gold_holding
    silver_holding
    currLocation
    gold_found
    silver_found
    location_count

    def initalize
        gold_holding = 0
        silver_holding = 0
        currLocation = 'Sutters Creek'
        gold_found = 0
        silver_found = 0
        location_count = 0
    end

end
