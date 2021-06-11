class Api::V1::ParksController < ApplicationController
  def index
    park = ParkFacade.by_location(search_params[:location])
    require "pry"; binding.pry
    # render json: ParkSerializer.new(park).serialize_json
  end

  private

  def search_params
    params.permit(:location)
  end
end
