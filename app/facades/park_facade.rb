class ParkFacade
  def self.by_location(location)
    city, state = location.split(',')
    park_data = ParkService.get_park(city, state)
    park = Park.create(
      name: park_data[:fullName],
      description: park_data[:description],
      directions: park_data[:directionsInfo],
      latitude: park_data[:latitude],
      longitude: park_data[:longitude]
    )
  end
end
