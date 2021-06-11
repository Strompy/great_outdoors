class Api::V1::ParksController < ApplicationController
  def index
    park = ParkFacade.by_location(search_params[:location])
    render json: ParkSerializer.new(park).serialized_json
  end

  private

  def search_params
    params.permit(:location)
  end
end
