class ParkFacade
  def self.by_location(location)
    city, state = location.split(',')
    park_data = ParkService.get_park(city, state)
    image = ImageService.get_by_name(park_data[:fullName])
    park = Park.create(
      name: park_data[:fullName],
      description: park_data[:description],
      directions: park_data[:directionsInfo],
      image_url: image
    )
  end
end
