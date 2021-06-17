class Api::V1::ParksController < ApplicationController
  def index
    if search_params[:location]
      park = search_for_park(search_params[:location])
      render json: ParkSerializer.new(park).serialized_json
    elsif search_params[:order] == 'desc'
      parks = Park.order(created_at: :desc)
      render json: ParkSerializer.new(parks).serialized_json
    elsif search_params[:order] == 'alpha_asc'
      parks = Park.order(:name)
      render json: ParkSerializer.new(parks).serialized_json
    elsif search_params[:order] == 'alpha_desc'
      parks = Park.order(name: :desc)
      render json: ParkSerializer.new(parks).serialized_json
    else
      parks = Park.all
      render json: ParkSerializer.new(parks).serialized_json
    end
  end

  private

  def search_params
    params.permit(:location, :order)
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
