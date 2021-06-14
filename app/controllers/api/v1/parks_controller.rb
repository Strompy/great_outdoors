class Api::V1::ParksController < ApplicationController
  def index
    location = search_params[:location].downcase.squish
    search = Search.find_by(location: location)
    if search
      park = search.parks.first
    else
      park = ParkFacade.by_location(location)
      park.searches << Search.create(location: location)
    end
    render json: ParkSerializer.new(park).serialized_json
  end

  private

  def search_params
    params.permit(:location)
  end
end
