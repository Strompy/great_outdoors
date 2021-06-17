class Api::V1::ParksController < ApplicationController
  def index
    if search_params[:location]
      parks = search_for_park(search_params[:location])
    elsif search_params[:order] == 'desc'
      parks = Park.order(created_at: :desc)
    elsif search_params[:order] == 'alpha_asc'
      parks = Park.order(:name)
    elsif search_params[:order] == 'alpha_desc'
      parks = Park.order(name: :desc)
    else
      parks = Park.all
    end
    if search_params[:filter]
      parks = parks.where("lower(name) LIKE ?", "%#{search_params[:filter].downcase}%")
    end
    if parks.empty?
      render json: 'No results found'.to_json
    else
      render json: ParkSerializer.new(parks).serialized_json
    end
  end

  private

  def search_params
    params.permit(:location, :order, :filter)
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
    [park]
  end
end
