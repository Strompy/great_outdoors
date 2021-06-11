class ParkFacade
  def self.by_location(location)
    city, state = location.split(',')
    park_data = ParkService.get_park(city, state)
    require "pry"; binding.pry
  end
end
