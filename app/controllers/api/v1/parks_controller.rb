class Api::V1::ParksController < ApplicationController
  def index
    if search_params[:location].nil?
      parks = Park.all
      render json: ParkSerializer.new(parks).serialized_json
    else
      park = search_for_park(search_params[:location])
      render json: ParkSerializer.new(park).serialized_json
    end
  end

  private

  def search_params
    params.permit(:location)
  end

  def search_for_park(search_location)
    location = search_location.downcase.squish
    search = Search.find_by(location: location)
    if search
      park = search.parks.first
    else
      park = ParkFacade.by_location(location)
      park.searches << Search.create(location: location)
    end
    park
  end
end
